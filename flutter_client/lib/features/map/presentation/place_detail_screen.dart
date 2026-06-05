import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../collection/data/collection_repository.dart';
import '../../collection/data/stub_collection_repository.dart';
import '../data/map_api_data_source.dart';
import '../models/map_inventory_item.dart';
import '../models/map_place.dart';
import '../models/map_review.dart';

const _heroHeight = 280.0;

Color _categoryColor(String code) => switch (code) {
      'bar' => const Color(0xFFFF7E36),
      'pub' => const Color(0xFFC4963A),
      'liquor_shop' => const Color(0xFF4F7ED4),
      'outdoor_spot' => const Color(0xFF5CA874),
      _ => const Color(0xFF6B6B8A),
    };

String _categoryLabel(String code) => switch (code) {
      'bar' => 'Bar',
      'pub' => 'Pub',
      'liquor_shop' => 'Liquor Shop',
      'outdoor_spot' => 'Outdoor',
      _ => code,
    };

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final MapPlace place;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  final _scrollCtrl = ScrollController();
  // Replace StubCollectionRepository with a real implementation once
  // collection-service is available.
  final CollectionRepository _collection = const StubCollectionRepository();
  bool _heroVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    final expanded = _scrollCtrl.offset < _heroHeight - kToolbarHeight;
    if (expanded != _heroVisible) setState(() => _heroVisible = expanded);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final place = widget.place;
    final catColor = _categoryColor(place.layerCode);
    final iconColor = _heroVisible ? Colors.white : palette.onSurface;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      body: CustomScrollView(
        controller: _scrollCtrl,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: _heroHeight,
            backgroundColor: _heroVisible
                ? Colors.transparent
                : palette.surfaceContainerLowest,
            elevation: _heroVisible ? 0 : 0.5,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.chevron_left, color: iconColor, size: 26),
                  Text(
                    '지도',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            leadingWidth: 64,
            actions: [
              IconButton(
                icon: Icon(Icons.share_outlined, color: iconColor, size: 22),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border, color: iconColor, size: 22),
                onPressed: () {},
              ),
              if (place.layerCode == 'liquor_shop')
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined, color: iconColor, size: 22),
                  onPressed: () {},
                ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _HeroSection(place: place, catColor: catColor),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CoreInfoCard(place: place, catColor: catColor, palette: palette),
                _buildTypeSection(palette),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSection(AppPalette palette) {
    return switch (widget.place.layerCode) {
      'bar' || 'pub' => Column(children: [
          _MenuSection(place: widget.place, palette: palette),
          const SizedBox(height: 8),
          _ReviewsSection(place: widget.place, palette: palette),
        ]),
      'liquor_shop' => _LiquorsSection(
          place: widget.place,
          palette: palette,
          collection: _collection,
        ),
      'outdoor_spot' => _LocationSection(palette: palette),
      _ => _ReviewsSection(place: widget.place, palette: palette),
    };
  }
}

// ─── Hero ───────────────────────────────────────────────────────────────────

class _HeroSection extends StatefulWidget {
  const _HeroSection({required this.place, required this.catColor});
  final MapPlace place;
  final Color catColor;

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection> {
  final _pageCtrl = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final urls = widget.place.imageUrls;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (urls.isEmpty)
          Container(
            color: widget.catColor.withValues(alpha: 0.14),
            child: Center(
              child: SvgPicture.asset(
                isDark
                    ? 'assets/on-the-block-white.svg'
                    : 'assets/on-the-block-dark.svg',
                width: 130,
              ),
            ),
          )
        else
          PageView.builder(
            controller: _pageCtrl,
            itemCount: urls.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (_, i) => Image.network(
              urls[i],
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: widget.catColor.withValues(alpha: 0.14),
                child: Center(
                  child: SvgPicture.asset(
                    isDark
                        ? 'assets/on-the-block-white.svg'
                        : 'assets/on-the-block-dark.svg',
                    width: 100,
                  ),
                ),
              ),
            ),
          ),

        // Top gradient for icon readability
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Color(0x80000000), Colors.transparent],
            ),
          ),
        ),

        // Dot indicators
        if (urls.length > 1)
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(urls.length, (i) {
                final active = i == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: active ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: active ? 1.0 : 0.5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

// ─── Core Info Card ─────────────────────────────────────────────────────────

class _CoreInfoCard extends StatelessWidget {
  const _CoreInfoCard({
    required this.place,
    required this.catColor,
    required this.palette,
  });
  final MapPlace place;
  final Color catColor;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final hasRating = place.rating.isNotEmpty;
    // "19:00 - 02:00" → "19:00 ~ 02:00"
    final hoursDisplay = place.openHours.isNotEmpty
        ? place.openHours.replaceAll(' - ', ' ~ ')
        : '';

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.outlineVariant),
        boxShadow: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: catColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          _categoryLabel(place.layerCode).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        place.name,
                        style: TextStyle(
                          color: palette.onSurface,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                if (hasRating) ...[
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                    decoration: BoxDecoration(
                      color: palette.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star_rounded, color: AppColors.primaryContainer, size: 16),
                        const SizedBox(width: 3),
                        Text(
                          place.rating,
                          style: TextStyle(
                            color: palette.onSurface,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (place.reviewCount != null) ...[
                          const SizedBox(width: 3),
                          Text(
                            '(${place.reviewCount})',
                            style: TextStyle(color: palette.secondary, fontSize: 11),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 14),
            if (place.isOpenNow != null) ...[
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: place.isOpenNow!
                          ? const Color(0xFF4CAF50)
                          : palette.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    place.isOpenNow! ? '영업 중' : '영업 종료',
                    style: TextStyle(
                      color: place.isOpenNow!
                          ? const Color(0xFF4CAF50)
                          : palette.secondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (hoursDisplay.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Text(
                      hoursDisplay,
                      style: TextStyle(color: palette.secondary, fontSize: 13),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 10),
            ],
            if (place.address.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined, color: palette.secondary, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      place.address,
                      style: TextStyle(
                        color: palette.onSurfaceVariant,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Section Shell ───────────────────────────────────────────────────────────

class _SectionShell extends StatelessWidget {
  const _SectionShell({required this.title, required this.child, this.trailing});
  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              if (trailing != null) ...[
                const Spacer(),
                trailing!,
              ],
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

// ─── Menu Section (Bar / Pub) ────────────────────────────────────────────────

class _MenuSection extends StatelessWidget {
  const _MenuSection({required this.place, required this.palette});
  final MapPlace place;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final items = place.menu;

    if (items.isEmpty) {
      return _SectionShell(
        title: 'Menu',
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: palette.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                '등록된 메뉴가 없습니다.',
                style: TextStyle(color: palette.secondary, fontSize: 13),
              ),
            ),
          ),
        ),
      );
    }

    final displayItems = items.take(3).toList();
    final hasMore = items.length > 3;

    return _SectionShell(
      title: 'Menu',
      trailing: hasMore
          ? TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MenuListScreen(place: place),
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryContainer,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'View All',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            )
          : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: palette.outlineVariant),
        ),
        child: Column(
          children: [
            for (var i = 0; i < displayItems.length; i++) ...[
              if (i > 0)
                Divider(height: 1, thickness: 1, color: palette.outlineVariant),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    if (displayItems[i].imageUrl.isNotEmpty) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          displayItems[i].imageUrl,
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: palette.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.restaurant_menu,
                                color: palette.secondary, size: 24),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayItems[i].name,
                            style: TextStyle(
                              color: palette.onSurface,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (displayItems[i].desc.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Text(
                              displayItems[i].desc,
                              style: TextStyle(color: palette.secondary, fontSize: 12),
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (displayItems[i].formattedPrice.isNotEmpty) ...[
                      const SizedBox(width: 12),
                      Text(
                        displayItems[i].formattedPrice,
                        style: TextStyle(
                          color: displayItems[i].priceKrw == 0
                              ? palette.secondary
                              : AppColors.primaryContainer,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Reviews Section (Bar / Pub) ─────────────────────────────────────────────

class _ReviewsSection extends StatefulWidget {
  const _ReviewsSection({required this.place, required this.palette});
  final MapPlace place;
  final AppPalette palette;

  @override
  State<_ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<_ReviewsSection> {
  late final List<MapReview> _reviews;

  @override
  void initState() {
    super.initState();
    _reviews = List.of(widget.place.reviews);
  }

  void _onReviewAdded(MapReview review) {
    setState(() => _reviews.insert(0, review));
  }

  @override
  Widget build(BuildContext context) {
    final palette = widget.palette;
    return _SectionShell(
      title: 'Reviews',
      trailing: TextButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => _AddReviewSheet(
            placeId: widget.place.id,
            onReviewAdded: _onReviewAdded,
          ),
        ),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryContainer,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'Add Review',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
      ),
      child: _reviews.isEmpty
          ? DecoratedBox(
              decoration: BoxDecoration(
                color: palette.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: palette.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'No reviews yet. Be the first to share your thoughts!',
                    style: TextStyle(color: palette.secondary, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                for (final r in _reviews) ...[
                  _ReviewCard(review: r, palette: palette),
                  const SizedBox(height: 10),
                ],
              ],
            ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review, required this.palette});
  final MapReview review;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: palette.surfaceContainerLow,
                  child: Text(
                    review.author.isNotEmpty ? review.author[0].toUpperCase() : '?',
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  review.author,
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star_rounded,
                      size: 13,
                      color: i < review.rating
                          ? AppColors.primaryContainer
                          : palette.outlineVariant,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  review.dateLabel,
                  style: TextStyle(color: palette.secondary, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              review.body,
              style: TextStyle(
                color: palette.onSurfaceVariant,
                fontSize: 13,
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Add Review Bottom Sheet ──────────────────────────────────────────────────

class _AddReviewSheet extends StatefulWidget {
  const _AddReviewSheet({required this.placeId, required this.onReviewAdded});
  final String placeId;
  final ValueChanged<MapReview> onReviewAdded;

  @override
  State<_AddReviewSheet> createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<_AddReviewSheet> {
  int _rating = 0;
  bool _submitting = false;
  final _bodyCtrl = TextEditingController();
  final _api = MapApiDataSource();

  @override
  void dispose() {
    _bodyCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_rating == 0 || _submitting) return;
    setState(() => _submitting = true);
    try {
      final review = await _api.submitReview(
        markerId: widget.placeId,
        author: '익명',
        rating: _rating,
        reviewBody: _bodyCtrl.text.trim(),
      );
      if (!mounted) return;
      widget.onReviewAdded(review);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted successfully.')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit review. Please try again.')),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final systemBottom = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(24, 16, 24, 24 + bottomInset + systemBottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: palette.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Write a Review',
            style: TextStyle(
              color: palette.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (i) {
              return GestureDetector(
                onTap: () => setState(() => _rating = i + 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    i < _rating ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: AppColors.primaryContainer,
                    size: 44,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _bodyCtrl,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Share your experience at this place.',
              hintStyle: TextStyle(color: palette.secondary, fontSize: 14),
              filled: true,
              fillColor: palette.surfaceContainerLow,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: palette.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: palette.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primaryContainer),
              ),
              contentPadding: const EdgeInsets.all(14),
            ),
            style: TextStyle(color: palette.onSurface, fontSize: 14),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (_rating > 0 && !_submitting) ? _submit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryContainer,
                foregroundColor: Colors.white,
                disabledBackgroundColor: const Color(0xFFE0E0E0),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _submitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Submit Review',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Liquors Section (Liquor Shop) ───────────────────────────────────────────

class _LiquorsSection extends StatelessWidget {
  const _LiquorsSection({
    required this.place,
    required this.palette,
    required this.collection,
  });
  final MapPlace place;
  final AppPalette palette;
  final CollectionRepository collection;

  @override
  Widget build(BuildContext context) {
    final items = place.inventory;

    if (items.isEmpty) {
      return _SectionShell(
        title: 'Available Liquors',
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: palette.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                '등록된 재고 정보가 없습니다.',
                style: TextStyle(color: palette.secondary, fontSize: 13),
              ),
            ),
          ),
        ),
      );
    }

    return _SectionShell(
      title: 'Available Liquors',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: palette.outlineVariant),
        ),
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0)
                Divider(height: 1, thickness: 1, color: palette.outlineVariant),
              _LiquorRow(
                item: items[i],
                placeId: place.id,
                palette: palette,
                collection: collection,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LiquorRow extends StatelessWidget {
  const _LiquorRow({
    required this.item,
    required this.placeId,
    required this.palette,
    required this.collection,
  });
  final MapInventoryItem item;
  final String placeId;
  final AppPalette palette;
  final CollectionRepository collection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: palette.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.liquor, color: palette.secondary, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.displayName,
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.formattedPrice.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    item.formattedPrice,
                    style: const TextStyle(
                      color: AppColors.primaryContainer,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () async {
              await collection.addToCart(
                beverageId: item.beverageId,
                nameKo: item.nameKo,
                nameEn: item.nameEn,
                priceKrw: item.priceKrw,
                placeId: placeId,
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.displayName}이(가) 컬렉션에 추가됐습니다.'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('담기 +',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

// ─── Location Section (Outdoor) ──────────────────────────────────────────────

class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.palette});
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return _SectionShell(
      title: '장소 정보',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: palette.outlineVariant),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: palette.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.map_outlined, size: 48, color: Color(0xFF5CA874)),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '탁 트인 전망과 함께 즐길 수 있는 야외 테라스 좌석입니다. 선선한 바람과 함께 도심 속 여유를 만끽할 수 있는 낭만적인 분위기를 선사합니다.',
                style: TextStyle(
                  color: palette.onSurfaceVariant,
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Menu List Screen ────────────────────────────────────────────────────────

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key, required this.place});
  final MapPlace place;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final items = place.menu;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: palette.surfaceContainerLowest,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: palette.onSurface, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${place.name} — Menu',
          style: TextStyle(
            color: palette.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, MediaQuery.of(context).padding.bottom + 24),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 1),
        itemBuilder: (context, i) {
          final item = items[i];
          return Container(
            color: palette.surfaceContainerLowest,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                if (item.imageUrl.isNotEmpty) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.imageUrl,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        width: 64,
                        height: 64,
                        color: palette.surfaceContainerLow,
                        child: Icon(Icons.restaurant_menu,
                            color: palette.secondary, size: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          color: palette.onSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (item.desc.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          item.desc,
                          style: TextStyle(color: palette.secondary, fontSize: 12),
                        ),
                      ],
                    ],
                  ),
                ),
                if (item.formattedPrice.isNotEmpty) ...[
                  const SizedBox(width: 12),
                  Text(
                    item.formattedPrice,
                    style: TextStyle(
                      color: item.priceKrw == 0
                          ? palette.secondary
                          : AppColors.primaryContainer,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
