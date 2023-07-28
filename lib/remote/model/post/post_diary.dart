class PostDiaryPayload {
  PostDiaryPayload({
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

  Map<String, dynamic> toMap() {
    return {
      'base64Images': base64Images,
      'isIncludeInPhotoGallery': isIncludeInPhotoGallery,
      'comments': comments,
      'date': 'date',
      'area': area,
      'taxCategory': taxCategory,
      'tags': tags,
      'isExistingEvent': isExistingEvent,
      'event': event,
    };
  }
}
