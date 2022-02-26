import 'package:tenka/tenka.dart';
import 'package:tenka_dev_tools/tools.dart';
import 'package:utilx/utilities/locale.dart';

import '../../utils.dart';

const Locale locale = Locale(LanguageCodes.en);

Future<void> main() async {
  await MockedAnimeExtractor(
    MockedAnimeExtractorOptions(
      search: (final AnimeExtractor ext) => ext.search(
        'bunny girl',
        locale,
      ),
      getInfo: (final AnimeExtractor ext) => ext.getInfo(
        'https://zoro.to/rascal-does-not-dream-of-bunny-girl-senpai-149?ref=search',
        locale,
      ),
      getSources: (final AnimeExtractor ext) => ext.getSources(
        const EpisodeInfo(
          episode: '1',
          url:
              'https://zoro.to/watch/rascal-does-not-dream-of-bunny-girl-senpai-149?ep=4008',
          locale: locale,
        ),
      ),
      handleEnvironment: GlobalState.handleIndividualTestEnvironment,
    ),
  ).run(Utils.getAnimeDS('zoro_to'));
}
