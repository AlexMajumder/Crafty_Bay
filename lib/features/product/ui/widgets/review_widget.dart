import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/review_list_model.dart';

class ReviewWidgetDesign extends StatelessWidget {
  const ReviewWidgetDesign({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    int fullStars = reviewModel.rating?.floor() ?? 0;
    bool hasHalfStar = (reviewModel.rating ?? 0) - fullStars >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    String formattedDate = 'N/A';
    if (reviewModel.createdAt != null && reviewModel.createdAt!.isNotEmpty) {
      try {
        DateTime date = DateTime.parse(reviewModel.createdAt!);
        formattedDate = DateFormat('dd MMM, yyyy').format(date);
      } catch (e) {
        formattedDate = 'Invalid date';
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: reviewModel.user?.avatarUrl != null &&
                      reviewModel.user!.avatarUrl!.isNotEmpty
                      ? NetworkImage(reviewModel.user!.avatarUrl!)
                      : null,
                  child: reviewModel.user?.avatarUrl == null ||
                      reviewModel.user!.avatarUrl!.isEmpty
                      ? const Icon(Icons.person, size: 20)
                      : null,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${reviewModel.user!.firstName!} ${reviewModel.user!.lastName!}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    reviewModel.comment ?? 'No comment available',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            // Rating Row
            Row(
              children: [
                ...List.generate(
                    fullStars,
                        (_) =>
                    const Icon(Icons.star, color: Colors.amber, size: 18)),
                if (hasHalfStar)
                  const Icon(Icons.star_half, color: Colors.amber, size: 18),
                ...List.generate(
                    emptyStars,
                        (_) => const Icon(Icons.star_border,
                        color: Colors.amber, size: 18)),
                const SizedBox(width: 8),
                Text('${reviewModel.rating}',
                    style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}