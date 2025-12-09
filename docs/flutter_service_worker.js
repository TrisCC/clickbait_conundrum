'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f6d65425c692927266a19b560725312d",
"assets/AssetManifest.json": "d893f8ef234dc7a275efca6c0897f25a",
"assets/assets/images/Tin%2520Star%2520Logo.png": "9defb3a2353d6d8f8c6281ebd68d68c3",
"assets/assets/level_data/percentage_10_level_01.csv": "90c77e1f8d7976ce9b5efaf8fb404ea7",
"assets/assets/level_data/percentage_10_level_02.csv": "6c75b96b49f662f91125b21404823edc",
"assets/assets/level_data/percentage_10_level_03.csv": "2bfa8edb8bafef0753bed614f0bb96c7",
"assets/assets/level_data/percentage_10_level_04.csv": "92df8785571eafb4ac88ca755007e910",
"assets/assets/level_data/percentage_10_level_05.csv": "4ac82f580274e18370c591fb235f5f5a",
"assets/assets/level_data/percentage_10_level_06.csv": "7459adc350c2e096a4d7add4dee9a084",
"assets/assets/level_data/percentage_10_level_07.csv": "052358c471beffab0948dc59a5781b4f",
"assets/assets/level_data/percentage_10_level_08.csv": "7c77b7c0218f4c4142f0ebe0cf5b8e70",
"assets/assets/level_data/percentage_10_level_09.csv": "bba2b661e41a5ecf81f03207f7bfc442",
"assets/assets/level_data/percentage_10_level_10.csv": "a2edf4b760d1bca4ee32b877b8f723e0",
"assets/assets/level_data/percentage_10_level_11.csv": "34a383c6b509e4d4c5954cb237330c41",
"assets/assets/level_data/percentage_10_level_12.csv": "3a035d3a22fb854a2ca02e8461056cd5",
"assets/assets/level_data/percentage_20_level_01.csv": "16795e6b7e04407f023d85693f368082",
"assets/assets/level_data/percentage_20_level_02.csv": "13d3e0baa8b4b3c43d88ff33ccbb01a9",
"assets/assets/level_data/percentage_20_level_03.csv": "cd4a13d6022172cbf6191a337ae4f6de",
"assets/assets/level_data/percentage_20_level_04.csv": "052779f3d8cbf1dccdeb15582d8a699b",
"assets/assets/level_data/percentage_20_level_05.csv": "31117ea6d18dbf14678592bbb3a983a6",
"assets/assets/level_data/percentage_20_level_06.csv": "34e8af519c6f69a127e36f915fbf4f35",
"assets/assets/level_data/percentage_20_level_07.csv": "d32d5814359a48ac9ea7290a8efc2c9a",
"assets/assets/level_data/percentage_20_level_08.csv": "0896026cdcf6fe6741818ebc6c1ddf50",
"assets/assets/level_data/percentage_20_level_09.csv": "3c13468b1e9cdea223a172d453510118",
"assets/assets/level_data/percentage_20_level_10.csv": "d81b99565de823785bb655850bb91796",
"assets/assets/level_data/percentage_20_level_11.csv": "b1412db98395bf08190acb5eb77c4648",
"assets/assets/level_data/percentage_20_level_12.csv": "bcf5c6fe545ba3d5f57d4f218cfdceb7",
"assets/assets/level_data/percentage_30_level_01.csv": "a3df20f5b120c9603306442f57b58769",
"assets/assets/level_data/percentage_30_level_02.csv": "a24fc8a5c907b70d77f1a89cb6f78809",
"assets/assets/level_data/percentage_30_level_03.csv": "cf45cbd5b44b4f9edfd7c7ede9f5a5c6",
"assets/assets/level_data/percentage_30_level_04.csv": "2e465bb5b525d71edc0f060e6f7e0af0",
"assets/assets/level_data/percentage_30_level_05.csv": "ff883fc5fa37d42aac2ef25c93b9f605",
"assets/assets/level_data/percentage_30_level_06.csv": "b4c5227a00572ccf5638cb0ccbbc84c3",
"assets/assets/level_data/percentage_30_level_07.csv": "683b9498a77af1be8e1e8cd008ee33b9",
"assets/assets/level_data/percentage_30_level_08.csv": "25549923f834a1ddc3c7b548d0ed17d3",
"assets/assets/level_data/percentage_30_level_09.csv": "cb918669d98cbc2584bc3602edbae178",
"assets/assets/level_data/percentage_30_level_10.csv": "e83bfb532daa86e0c7ebc541c3385cb6",
"assets/assets/level_data/percentage_30_level_11.csv": "eebe97e1bb753d9d8344410e01789d3e",
"assets/assets/level_data/percentage_30_level_12.csv": "494ce78e996ddb6b160e6ae08feaafdc",
"assets/assets/level_data/percentage_40_level_01.csv": "b71a2b2abebd475ba97ae94a986eb0ac",
"assets/assets/level_data/percentage_40_level_02.csv": "5c1497053c48443c157cdb60bce06aae",
"assets/assets/level_data/percentage_40_level_03.csv": "6235f4b6f12a3d49ab800b29f6481846",
"assets/assets/level_data/percentage_40_level_04.csv": "5fe4e402c3bfb4729dabad436ed1c6fa",
"assets/assets/level_data/percentage_40_level_05.csv": "e4b697fda5699a1bf19b08f6e382677f",
"assets/assets/level_data/percentage_40_level_06.csv": "8ad5eefb4836b088f33676feca818e93",
"assets/assets/level_data/percentage_40_level_07.csv": "0056cbebb10c5e3adb15d6a589394520",
"assets/assets/level_data/percentage_40_level_08.csv": "2cf28f1a0696be941fd8cc9d806773f8",
"assets/assets/level_data/percentage_40_level_09.csv": "acf663392258d0100745c4aed7431438",
"assets/assets/level_data/percentage_40_level_10.csv": "64a82d9be8d8c4cf9bf572458df12a13",
"assets/assets/level_data/percentage_40_level_11.csv": "f95f11b71852f4809690909239f3d774",
"assets/assets/level_data/percentage_40_level_12.csv": "afd7feecbeac1e569b2ded791e5d0c5a",
"assets/assets/level_data/percentage_50_level_01.csv": "6a3f936100be00eae85cda7e24768eeb",
"assets/assets/level_data/percentage_50_level_02.csv": "a091710429bbefd277ac85c6c3f0f276",
"assets/assets/level_data/percentage_50_level_03.csv": "80c43133cd4a806504dcddbf6fb15309",
"assets/assets/level_data/percentage_50_level_04.csv": "2e41abf72b72a7daa00a2ab1295664e9",
"assets/assets/level_data/percentage_50_level_05.csv": "ae688086b662ffc04ed5246526cdbeb7",
"assets/assets/level_data/percentage_50_level_06.csv": "ca45d5e24933e3afce02250ab5322f84",
"assets/assets/level_data/percentage_50_level_07.csv": "9bc7f520f0cde4f0203b2136f5e98a25",
"assets/assets/level_data/percentage_50_level_08.csv": "e53def496f1a477e9cb75d1e2c2faf15",
"assets/assets/level_data/percentage_50_level_09.csv": "a164e9627f8fe94f57515af1669989a0",
"assets/assets/level_data/percentage_50_level_10.csv": "6125330ffbb081ec5863215b86a37464",
"assets/assets/level_data/percentage_50_level_11.csv": "2c0306c4be9359527f0b485fa3f7818a",
"assets/assets/level_data/percentage_50_level_12.csv": "6f5c3db7a217adabe12443c740b4f5d8",
"assets/assets/level_data/percentage_60_level_01.csv": "b6993f57ed65030ef034e9b4650d2ed0",
"assets/assets/level_data/percentage_60_level_02.csv": "256d6f82a7149dee31926903950ae0d1",
"assets/assets/level_data/percentage_60_level_03.csv": "7ae32c61773a1e032a551eb7980777a1",
"assets/assets/level_data/percentage_60_level_04.csv": "c8e5dfa007a5e9410fc61ae957abb4ea",
"assets/assets/level_data/percentage_60_level_05.csv": "2d87bbcdb3558f518336c1b3544ff829",
"assets/assets/level_data/percentage_60_level_06.csv": "f2663256ec728c881ae05cd5f38d09ed",
"assets/assets/level_data/percentage_60_level_07.csv": "2e0ea018965189215a19b07fc9e031af",
"assets/assets/level_data/percentage_60_level_08.csv": "a29d6a0984941a7b4522390b3db47d55",
"assets/assets/level_data/percentage_60_level_09.csv": "bf3bac54464551f9187c9359ae20a9ac",
"assets/assets/level_data/percentage_60_level_10.csv": "064096bb6f85786e39475214e67f7141",
"assets/assets/level_data/percentage_60_level_11.csv": "b4baa4b3e0f4344e277fcacefe704492",
"assets/assets/level_data/percentage_60_level_12.csv": "8c02ead5b35f01e096bed713220f8c49",
"assets/assets/level_data/percentage_70_level_01.csv": "6f8f7b0dce51ca2e171f59c1d670e221",
"assets/assets/level_data/percentage_70_level_02.csv": "379230ed2b8e8981ec3d6a1d2e9deb59",
"assets/assets/level_data/percentage_70_level_03.csv": "f3bb349a465ef34a88717b2ac9b297ce",
"assets/assets/level_data/percentage_70_level_04.csv": "e3b0dc30453172607c75da35bf813a61",
"assets/assets/level_data/percentage_70_level_05.csv": "9b80ac08712f1a8bd8cb9dba80ffeabb",
"assets/assets/level_data/percentage_70_level_06.csv": "adccd74753fdb6020e375b052adb176c",
"assets/assets/level_data/percentage_70_level_07.csv": "90a53c2cac08d3bc0d9a3e1e31f5f8a0",
"assets/assets/level_data/percentage_70_level_08.csv": "75e9bb94c38e66af3533b8ef50faeb1f",
"assets/assets/level_data/percentage_70_level_09.csv": "ec30cfc2b058d9c3485ac1b9700513bb",
"assets/assets/level_data/percentage_70_level_10.csv": "2828df9b8aec9998974ae6d21153d356",
"assets/assets/level_data/percentage_70_level_11.csv": "f878f5a3e069e6a6840ba93ce69b4c51",
"assets/assets/level_data/percentage_70_level_12.csv": "b4d42a66ce20fd9f43973a22d5c5da8f",
"assets/assets/level_data/percentage_80_level_01.csv": "074f9b2ce3e528f66ebd84a3eb73aa91",
"assets/assets/level_data/percentage_80_level_02.csv": "4b8b27a19ed658cde314950fe7779fc5",
"assets/assets/level_data/percentage_80_level_03.csv": "2518cc97203d50e44b4d073d42308bf9",
"assets/assets/level_data/percentage_80_level_04.csv": "6f5c318d03f6eaccafc76ac0f5593d68",
"assets/assets/level_data/percentage_80_level_05.csv": "d2182a54f2ccb8903ed3e4048c7e855b",
"assets/assets/level_data/percentage_80_level_06.csv": "d42f322577a62d8028688869caab5b14",
"assets/assets/level_data/percentage_80_level_07.csv": "2a0f7b6d9d59dc638768c0f5d307a800",
"assets/assets/level_data/percentage_80_level_08.csv": "8d9d3c325557ecd746eb34b29499c326",
"assets/assets/level_data/percentage_80_level_09.csv": "5fd65d0ae56fedd2b4e616263eed442d",
"assets/assets/level_data/percentage_80_level_10.csv": "8faefee1aa6df2d8afe8860ac6c03732",
"assets/assets/level_data/percentage_80_level_11.csv": "7679f2b5f59723e6e7542f0fb3b79ca6",
"assets/assets/level_data/percentage_80_level_12.csv": "4afaee38d16215d44f995cfa16d3f2be",
"assets/assets/level_data/percentage_90_level_01.csv": "950f50fb02f27887e162aedc805f8e22",
"assets/assets/level_data/percentage_90_level_02.csv": "f189a2b61fa4df5dbdac48b95e4c3e39",
"assets/assets/level_data/percentage_90_level_03.csv": "eda19107849f9230de079caa4099c208",
"assets/assets/level_data/percentage_90_level_04.csv": "c25d80a8f9aca1f55e606f9be3b706ff",
"assets/assets/level_data/percentage_90_level_05.csv": "c583f49eaf04808133751b8f332ca85a",
"assets/assets/level_data/percentage_90_level_06.csv": "d77f04d1a5bf97bb3f522cdd4d0f9f73",
"assets/assets/level_data/percentage_90_level_07.csv": "fae39a70b290b02895855f4a2144b409",
"assets/assets/level_data/percentage_90_level_08.csv": "21dec371ab6d4e9f16f40f0131c5b72e",
"assets/assets/level_data/percentage_90_level_09.csv": "3a259fdecdc96f1683e1307d72ecc442",
"assets/assets/level_data/percentage_90_level_10.csv": "05ba533b1440c478e332e30a204584ce",
"assets/assets/level_data/percentage_90_level_11.csv": "0c0a14479c0fa43aad78f93d5b8fb920",
"assets/assets/level_data/percentage_90_level_12.csv": "8453d2fe9a40564f8f1a2999b8f6f77d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2446163fe6749495af476f9ea12d037a",
"assets/NOTICES": "2f40fd2e9e0fcf48b73133f07752ddc9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "8782f29a0c828499f05117895192b095",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f81720c730dbf07caa6c629bfe0b5338",
"/": "f81720c730dbf07caa6c629bfe0b5338",
"main.dart.js": "9602cb9e1f391ee8e338e4de1d760330",
"manifest.json": "505bda1fe8b0c020060ea1879a0eda60",
"version.json": "deb964059ae015aff7ef02cce16f0e19"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
