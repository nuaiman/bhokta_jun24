import 'package:flutter/material.dart';
import '../../../core/constants/palette.dart';
import '../../../models/landing_card_info.dart';
import 'landing_custom_card.dart';

class LandingHorizontalCards extends StatelessWidget {
  final List<LandingCardInfo> cards = [
    LandingCardInfo(
        id: 1,
        title: 'অভিযোগ প্রদানের জন্য কি কি দলিলাদি প্রয়োজন?',
        content:
            'অভিযোগ প্রদানের জন্য আপনার মোবাইল নাম্বার ও অভিযোগ সংক্রান্ত তথ্য প্রমাণ প্রয়োজন.'),
    LandingCardInfo(
        id: 2,
        title: 'অভিযোগ প্রদানের মূল্য এবং পরিশোধ পদ্ধতি কি?',
        content:
            'জাতীয় ভোক্তা অধিকার অভিযোগ গ্রহণের প্রক্রিয়াটি সম্পূর্ণ বিনামূল্যে, সঠিক অভিযোগ নিষ্পত্তিতে আপনাকে জরিমানাকৃত টাকার ২৫% প্রদান করা হবে।'),
    LandingCardInfo(
        id: 3,
        title: 'অভিযোগ প্রক্রিয়া সম্পাদনের সময়সীমা।',
        content:
            'আপনার অভিযোগ প্রক্রিয়া ৬০ কার্যদিবসের মধ্যে সম্পন্ন করা হবে।'),
    LandingCardInfo(
        id: 4,
        title: 'অভিযোগের বর্তমান অবস্থা কিভাবে যাচাই করব?',
        content:
            'অভিযোগ দাখিলের পর প্রতিটি অভিযোগের জন্য একটা স্বতন্ত্র ট্র্যাকিং নম্বর প্রদান করা হবে যেটা ব্যবহার করে অভিযোগের অগ্রগতি জানা যাবে।'),
    LandingCardInfo(
        id: 5,
        title: 'অভিযোগ প্রক্রিয়ার নির্দেশনাবলী?',
        content:
            'অভিযোগ ফরমের লাল তারকা চিহ্নিত ঘরগুলো অবশ্যই পূরণ করুন। ফরমের সাথে প্রয়োজনীয় তথ্যপ্রমাণ সংযুক্ত করে জমা দিতে পারবেন।'),
  ];

  LandingHorizontalCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 38.0),
        child: Row(
          children: cards.map((card) => _buildCardWithAvatar(card)).toList(),
        ),
      ),
    );
  }

  Widget _buildCardWithAvatar(LandingCardInfo card) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LandingCustomCard(card: card),
        Positioned(
          top: 20,
          left: -25,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Palette.scaffold,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Palette.green,
              child: Text(
                card.id.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
