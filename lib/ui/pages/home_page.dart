import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:flutter_sha/ui/widgets/home_service_item.dart';
import 'package:flutter_sha/ui/widgets/home_tips_item.dart';
import 'package:flutter_sha/ui/widgets/home_user_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: whiteColor,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_history.png', width: 20),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_statistic.png', width: 20),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_reward.png', width: 20),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: purpleColor,
        child: Image.asset('assets/ic_plus-circle.png', width: 24),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Akane', style: grayTextStyle.copyWith(fontSize: 16)),
              const SizedBox(height: 2),
              Text(
                'Kurokawa',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          image: AssetImage('assets/img_card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akane Kurokawa',
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
          const SizedBox(height: 28),
          Text(
            '**** **** **** 1937',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(height: 21),
          Text('Balance', style: whiteTextStyle.copyWith(fontSize: 14)),
          Text(
            '\$ 1,000,000',
            style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55% ',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'of \$ 10M',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 5,
              backgroundColor: lightBackgroundColor,
              valueColor: AlwaysStoppedAnimation(greenColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                imageUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                imageUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                imageUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServiceItem(
                imageUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                HomeLatestTransactionItem(
                  imageUrl: 'assets/ic_trx_topup.png',
                  title: 'Top Up',
                  date: 'Yesterday',
                  amount: '+\$ 100,000',
                ),
                HomeLatestTransactionItem(
                  imageUrl: 'assets/ic_trx_cashback.png',
                  title: 'Cashback',
                  date: 'Sep 11',
                  amount: '+\$ 75,000',
                ),
                HomeLatestTransactionItem(
                  imageUrl: 'assets/ic_trx_withdraw.png',
                  title: 'Withdraw',
                  date: 'Sep 10',
                  amount: '+\$ 200,000',
                ),
                HomeLatestTransactionItem(
                  imageUrl: 'assets/ic_trx_transfer.png',
                  title: 'Transfer',
                  date: 'Sep 10',
                  amount: '+\$ 50,000',
                ),
                HomeLatestTransactionItem(
                  imageUrl: 'assets/ic_trx_electric.png',
                  title: 'Electricity',
                  date: 'Sep 9',
                  amount: '+\$ 20,000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                  imageUrl: 'assets/img_friend1.png',
                  username: 'Vanica',
                ),
                HomeUserItem(
                  imageUrl: 'assets/img_friend2.png',
                  username: 'Miraa',
                ),
                HomeUserItem(
                  imageUrl: 'assets/img_friend3.png',
                  username: 'Clorinde',
                ),
                HomeUserItem(
                  imageUrl: 'assets/img_friend4.png',
                  username: 'Sugeng',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 17,
              mainAxisSpacing: 18,
              childAspectRatio: 0.9,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final tips = [
                {
                  'title': 'Best tips for using credit card',
                  'imageUrl': 'assets/img_tips1.png',
                  'url': 'https://www.google.com',
                },
                {
                  'title': 'Spot the good pie of finance model',
                  'imageUrl': 'assets/img_tips2.png',
                  'url': 'https://pub.dev',
                },
                {
                  'title': 'How to make a good financial',
                  'imageUrl': 'assets/img_tips3.png',
                  'url': 'https://dadada',
                },
                {
                  'title': 'Save more penny by doing this',
                  'imageUrl': 'assets/img_tips4.png',
                  'url': 'https://www.google.com',
                },
              ];

              return HomeTipsItem(
                title: tips[index]['title']!,
                imageUrl: tips[index]['imageUrl']!,
                url: tips[index]['url']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightBackgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 13),
            Wrap(
              spacing: 35,
              runSpacing: 25,
              children: [
                HomeServiceItem(
                  imageUrl: 'assets/ic_smartphone.png',
                  title: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  imageUrl: 'assets/ic_water.png',
                  title: 'Water',
                  onTap: () {},
                ),
                HomeServiceItem(
                  imageUrl: 'assets/ic_stream.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                HomeServiceItem(
                  imageUrl: 'assets/ic_movie.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                HomeServiceItem(
                  imageUrl: 'assets/ic_food.png',
                  title: 'Food',
                  onTap: () {},
                ),
                HomeServiceItem(
                  imageUrl: 'assets/ic_globe.png',
                  title: 'Travel',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
