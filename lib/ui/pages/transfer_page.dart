import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sha/blocs/user/user_bloc.dart';
import 'package:flutter_sha/models/transfer_form_model.dart';
import 'package:flutter_sha/models/user_model.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/pages/transfer_amount_page.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';
import 'package:flutter_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:flutter_sha/ui/widgets/transfer_result_user_item.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController searchController = TextEditingController(
    text: '',
  );
  UserModel? selectedUser;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(GetRecentUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 40),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          CustomFormField(
            label: 'by username',
            isShowLabel: false,
            controller: searchController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(
                  GetUserByUsername(username: searchController.text),
                );
              } else {
                selectedUser = null;
                userBloc.add(GetRecentUsers());
              }
              setState(() {});
            },
          ),
          searchController.text.isEmpty ? buildRecentUsers() : buildResults(),
        ],
      ),
      floatingActionButton:
          selectedUser != null
              ? Container(
                margin: const EdgeInsets.all(24),
                child: CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TransferAmountPage(
                              data: TransferFormModel(
                                sendTo: selectedUser!.username,
                              ),
                            ),
                      ),
                    );
                  },
                ),
              )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
                  children:
                      state.users.map((user) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => TransferAmountPage(
                                      data: TransferFormModel(
                                        sendTo: user.username,
                                      ),
                                    ),
                              ),
                            );
                          },
                          child: TransferRecentUserItem(user: user),
                        );
                      }).toList(),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget buildResults() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Results',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Wrap(
                  spacing: 30,
                  runSpacing: 17,
                  children:
                      state.users.map((user) {
                        return GestureDetector(
                          onTap:
                              () => setState(() {
                                selectedUser = user;
                              }),
                          child: TransferResultUserItem(
                            user: user,
                            isSelected: user.id == selectedUser?.id,
                          ),
                        );
                      }).toList(),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
