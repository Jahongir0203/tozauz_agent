class ListAPI {
  ListAPI._();
static const String BASE_URL = "https://mobile.tma.uz/api/v1/";
static const String ACCESS_TOKEN = 'access-token';
static const String RefreshToken = 'refresh-token';
static const String LANG = 'app_lang';
static const String OnBoard = 'app_onboarding';

/// News
static const String news = 'news/list/';
static const String newsDetail = 'news/detail/';
static const String newsCarousel = 'new/carousel';

static const String building = 'building/list/';
static const String category = 'category';
static const String categoryHaveNews = 'news/category/list/';
static const String imageShow = '${ListAPI.BASE_URL}uploads/images/';
static const String libraryCategoriesList = 'library/category/list/';
static const String libraryStatistic = 'library/statistics/';
static const String libraryList = 'library/items/list/';
static const String libraryItemDetail = 'library/item/detail/';
static const String login = 'account/auth/login/';
static const String profile = 'account/profile/';

/// Home-->
static const String story = 'announcement/story/list/';
static const String announcement = 'announcement/list/';
static const String announcementDetail = 'announcement/detail/';
static const String homeHemisStatistic = 'home/hemis/statistic';
static const String videoCourse = 'video/lesson/list/';
static const String videoCourseDetail = 'video/lesson/detail/';
static const String videoCourseCommentCreate = 'video/lesson/comment/create/';
static const String videoCourseCommentList = 'video/lesson/comment/list/';
static const String advertisement = 'advertisement/list/';
static const String socialNetworkLinks = 'announcement/social/networks/list/';
static const String socialNetworkCategory = 'announcement/social/networks/category/list/';
static const String faqCategory = 'announcement/faq/category/list/';
static const String faqResponse = 'announcement/faq/list/';

}