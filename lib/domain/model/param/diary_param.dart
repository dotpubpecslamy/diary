class DiaryParam {
  DiaryParam({
    required this.base64Images,
    required this.isIncludeInPhotoGallery,
    required this.comments,
    required this.date,
    required this.area,
    required this.taxCategory,
    required this.tags,
    required this.isExistingEvent,
    required this.event,
  });

  final List<String> base64Images;
  final bool isIncludeInPhotoGallery;
  final String comments;
  final String date;
  final String area;
  final String taxCategory;
  final String tags;
  final bool isExistingEvent;
  final String event;

  @override
  String toString() {
    return '[DiaryParam] $base64Images, $isIncludeInPhotoGallery, $comments, $date , $date, $area, $taxCategory, $tags, $isExistingEvent, $event';
  }
}
