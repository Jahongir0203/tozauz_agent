import '../../../export.dart';

class CustomPageSelector extends StatelessWidget {
  final int currentPage;
  final int maxPage, minPage;
  final Function() onNextPage, onPrevPage;
  final Function(int c) onPageChanged;

  const CustomPageSelector({
    super.key,
    required this.currentPage,
    required this.maxPage,
    required this.minPage,
    required this.onNextPage,
    required this.onPrevPage,
    required this.onPageChanged,
  });

  List<int> getPagesToShow() {
    const int visiblePages = 7; // Number of visible page buttons
    final List<int> pages = [];

    if (maxPage <= visiblePages) {
      // Show all pages if within the visible range
      for (int i = minPage; i <= maxPage; i++) {
        pages.add(i);
      }
    } else {
      if (currentPage <= 4) {
        // Near the start
        pages.addAll(List.generate(visiblePages, (index) => minPage + index));
      } else if (currentPage > maxPage - 4) {
        // Near the end
        pages.addAll(List.generate(
            visiblePages, (index) => maxPage - visiblePages + 1 + index));
      } else {
        // In the middle
        pages.addAll(List.generate(visiblePages, (index) => currentPage - 3 + index));
      }
    }

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: currentPage > minPage ? onPrevPage : null,
          color: currentPage > minPage ? AppColors.black : AppColors.grey2,
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        ...getPagesToShow().map((page) {
          final bool isActive = page == currentPage;
          return Expanded(
            child: IconButton(
              onPressed: () => onPageChanged(page),
              icon: Text(
                "$page",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: isActive ? AppColors.primaryColor : AppColors.black,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
        IconButton(
          onPressed: currentPage < maxPage ? onNextPage : null,
          color: currentPage < maxPage ? AppColors.black : AppColors.grey2,
          icon: const Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    );
  }
}
