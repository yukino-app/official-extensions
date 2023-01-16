import 'package:tenka/tenka.dart';
import 'package:tenka_dev_tools/tenka_dev_tools.dart';
import 'package:utilx/locale.dart';
import '../../../tools/utils.dart';

const Locale locale = Locale(LanguageCodes.en);
final TenkaLocalFileDS source = Utils.getAnimeDS('gogoanime_bid');
final MockedAnimeExtractor mocked = MockedAnimeExtractor(
  search: (final AnimeExtractor ext) => ext.search('bunny girl', locale),
  getInfo: (final AnimeExtractor ext) => ext.getInfo(
    'https://gogoanime.sk/category/seishun-buta-yarou-wa-bunny-girl-senpai-no-yume-wo-minai',
    locale,
  ),
  getSources: (final AnimeExtractor ext) => ext.getSources(
    'https://gogoanime.sk/spy-x-family-episode-1',
    locale,
  ),
);

Future<void> main() async {
  await Procedure.run(() => mocked.run(source));
}
