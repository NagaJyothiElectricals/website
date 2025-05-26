'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "dd7053ac9a53868e315ad991350462cc",
"version.json": "d5eee2adf4d6f70c9d072e7f2b52459f",
"index.html": "cf78aa521f5c1990bb259dc222f249b0",
"/": "cf78aa521f5c1990bb259dc222f249b0",
"main.dart.js": "96989777f7dba73d44c3ab13c2b63efa",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"logo.png": "12927020fb8974a523ea326f6aa5bba2",
"icons/android-chrome-192x192.png": "12927020fb8974a523ea326f6aa5bba2",
"icons/apple-touch-icon.png": "8bb1be448d0ba5de2c5ac92b84141f8f",
"icons/android-chrome-512x512.png": "021df0b0f3f95f62c56ee7d7d2d0074e",
"manifest.json": "6e1111b508a5fb44d386da938df8f88f",
"assets/AssetManifest.json": "570e838ed3597bb1f7a9077552a18588",
"assets/NOTICES": "e39f9efcf0a11315f4ec1518acfabba4",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "c3e3ae8f847e9d9c0f9f43b944396f1a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/glass_kit/assets/noise.png": "86f22ae1a498bb8f0c39264f9c7c796c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "233c55f4b75391319ea5d458d0c610ae",
"assets/fonts/MaterialIcons-Regular.otf": "b6a2d208fada593d72ee848f7cb7a083",
"assets/assets/images/pic64.jpg": "58c7c12f8509dc06284dfa127deb6cd0",
"assets/assets/images/pic70.jpg": "b613a1f6fe6a5a89e8e2ea936688fc49",
"assets/assets/images/pic58.jpg": "c3f9c4c064c2f9ee12d721ea3e5a6ce8",
"assets/assets/images/pic59.jpg": "4df7d0202f433609aff2b6990ca341b6",
"assets/assets/images/pic65.jpg": "f409ccba344232708352343b27122097",
"assets/assets/images/vannsh.png": "ff2e9448c1f4294db8b032507bbcda11",
"assets/assets/images/pic67.jpg": "6ba66cb34de81da1c0f9635dbedcceed",
"assets/assets/images/ar.png": "8b4daa2a22ac33978aa53e9cd84ccc64",
"assets/assets/images/shreegen.jpg": "6bc1e843ae2cd8813b265250e3b45676",
"assets/assets/images/pic66.jpg": "a68687a1a9f884ce8b7bfe5920b1efb2",
"assets/assets/images/scrappy.png": "e607b321e09dd7bfa63e4f99d4d1718b",
"assets/assets/images/goldfish.jpeg": "1f80ddcad8d207d6d88a18019da665a2",
"assets/assets/images/pic62.jpg": "1c05510b9c995845a2d3c1a6aaae8f8c",
"assets/assets/images/njelogo1.png": "8deef3f8a551c345fdd2f7d8b6059c4a",
"assets/assets/images/seimens.jpeg": "2eb82eead3ae9202fe5ff134899b372c",
"assets/assets/images/pic63.jpg": "c07204825f7336933d27fac86fb40e23",
"assets/assets/images/siris.png": "eef42f62495b45a406f4056fdea2d347",
"assets/assets/images/analys.png": "cbac342c8abe3f26e63bce7648c17641",
"assets/assets/images/pic49.jpg": "1ae6a2ca3acedfa4f0b6b46dee9d99f6",
"assets/assets/images/pic61.jpg": "e542faefc72e050e7d960be0674dc124",
"assets/assets/images/ponpure.png": "dd6bc4641ddecce69076fbecb548fc9d",
"assets/assets/images/njehome.jpeg": "30ce2e6b8e8236b5d7c77a9e8f8a9d4c",
"assets/assets/images/pic60.jpg": "6e12224a0bd99065c796a7398f9452e2",
"assets/assets/images/pic48.jpg": "28c4f9dff8da0444058b0eb9f90379ca",
"assets/assets/images/pic13.jpg": "c39a80bfccf45c7e8af579ea3c668eac",
"assets/assets/images/pic9.jpg": "222cb77488e5df896f8854a63a93e6be",
"assets/assets/images/hetero.jpg": "b56ed7f3e301c73e06371ed7f6540fc1",
"assets/assets/images/godavari.png": "5d18d8b07e7415d288cad486597a4e20",
"assets/assets/images/gmail1.jpeg": "843f137f467d1a1c3e7aef226a4bc5cc",
"assets/assets/images/pic8.jpg": "c1fde60352aad846c473c1baf0b21fb6",
"assets/assets/images/pic12.jpg": "a4e375ac953f67275b1e06365f33ec0e",
"assets/assets/images/njelogo.png": "f287cd9db208a50eb5b8a1b9032f136e",
"assets/assets/images/pic10.jpg": "5cec8d7e08e52e62d967756e3e0c75dc",
"assets/assets/images/abhiram.jpeg": "e5398409ebe6a11adbf1cc17ca5d81ad",
"assets/assets/images/pic38.jpg": "89f201d685aa638d717f7bcf50d029dc",
"assets/assets/images/LT.jpeg": "43477c2bd4ac60365fe91be4c101d3f4",
"assets/assets/images/agarvanshi.jpeg": "e39c979a894c89442821d99b91c05780",
"assets/assets/images/pic39.jpg": "0ce2abfc6f54fedd35bffad4f33b7051",
"assets/assets/images/pic11.jpg": "011034d18f3c80f65f3d9d01a41f5bb3",
"assets/assets/images/gmail.png": "3ccb33a50f3b4e199c4a68b192015ccb",
"assets/assets/images/pic29.jpg": "5c2aa223df054add1f9b43bd757d02aa",
"assets/assets/images/pic15.jpg": "4d9a7a52ae3310ef92eae98e21936e4e",
"assets/assets/images/arktek.png": "ac11724a04e1f8da0121f5924d21ab33",
"assets/assets/images/pic14.jpg": "d6765c4c6aa3313fedd750b15b62f43e",
"assets/assets/images/pic28.jpg": "e6c961ecb41636b5ed76097de109fbe4",
"assets/assets/images/srs.jpg": "c0a85cf99d748a6cb945c703d36d7574",
"assets/assets/images/pic16.jpg": "994a106eac7a6abe081e69b13b188612",
"assets/assets/images/abb.png": "66bec88d2cb348120ebf582faa85bcc4",
"assets/assets/images/saptagir.png": "a66b0d84be9f2e34555273c73bded0f3",
"assets/assets/images/mungi.jpg": "36783ad11aa63872c26cda796e916faa",
"assets/assets/images/pic17.jpg": "1250750ee37e74d4069edb1315df2cc1",
"assets/assets/images/leefine.jpeg": "b7a7a886eab10ea9cbc3b4b09505f3b6",
"assets/assets/images/raichandani.jpg": "44424a7bb3158b0e276fc3bd60e36fde",
"assets/assets/images/pic26.jpg": "cfd2d29cf2dadceb0c04d478ffa6154b",
"assets/assets/images/pic32.jpg": "7da64fecbcc047090a42cb99015b0345",
"assets/assets/images/asphar.jpeg": "d66ed831b4abfc2578061741df1316d3",
"assets/assets/images/ontop.png": "f72cf730d76f6c8505843fc022f40012",
"assets/assets/images/standard.jpeg": "5dab6f6ddd8dfbc27765569d4de06622",
"assets/assets/images/pic1.jpg": "ca3527542a086e37e10cd02a96eadde9",
"assets/assets/images/pic33.jpg": "07d59773a71534bece812bb64e79bef4",
"assets/assets/images/pic27.jpg": "35703b44cd5efa4ccdae56664d010ed6",
"assets/assets/images/heterocyclics.jpeg": "c5007147eb9b0aea5f4dc1e664ea8056",
"assets/assets/images/logo1.png": "1ee13e9b993b8bd557c3f508fd59866a",
"assets/assets/images/pic31.jpg": "da44be780e6e949299b114a0b8700fa8",
"assets/assets/images/pic25.jpg": "d2413342e14001caab8f9e9700094bf6",
"assets/assets/images/pic19.jpg": "9ab8b239ebbdccbfd99c2f4a4fa3ae0c",
"assets/assets/images/pic3.jpg": "60b187a578d792d580c0e802e3b9859b",
"assets/assets/images/kreative.png": "9153873bab34759581db9ec1f20a7826",
"assets/assets/images/lee.jpg": "2dbe42ae8ca9ea8ac5ca8bd6f6e1cd9c",
"assets/assets/images/pic2.jpg": "fb10181936228a64ca73009d6edf5065",
"assets/assets/images/pic18.jpg": "1a6b3a0640035f8c441f7d31a5d17116",
"assets/assets/images/pic24.jpg": "66cb90a7210c49b9e8a79424162c46bb",
"assets/assets/images/pic30.jpg": "967b3e8a2c2cb8d33d0278d1dea74f36",
"assets/assets/images/ji.png": "6d317bbc688ca9a6f5865dbbbcc9ad8c",
"assets/assets/images/logo.png": "f9ad6a9f9dc9aac27af3ca4f5bfe76d3",
"assets/assets/images/bjrinfra.png": "bd1e0876f8b9d2f3f375ab016a27d705",
"assets/assets/images/annora.png": "7edb08e1ba2594858b44c73753145cec",
"assets/assets/images/puzzolana.png": "52d03aa4db971c5658a0996dfa33189c",
"assets/assets/images/pic34.jpg": "098281e5f469cadd0df9877c6aa810ef",
"assets/assets/images/pic20.jpg": "70c57cec9be613cde4080fc0d4a17b16",
"assets/assets/images/pic6.jpg": "3152008984f754818135418315b57985",
"assets/assets/images/pic7.jpg": "f190bc49b15eb17361dd409eb00437b9",
"assets/assets/images/pic21.jpg": "491b1020f2d702bac5ec9d556c9e6dba",
"assets/assets/images/pic35.jpg": "1e1f424fe0a3a008092036d1c107c74a",
"assets/assets/images/linkedIn.png": "f08c524d147f46398cb54013ee7013ee",
"assets/assets/images/genx.jpeg": "602c72e2db3cb712b3c8801dcc477313",
"assets/assets/images/nifty.jpeg": "ef19a83fa7a3d23da9a288ebd85ad6b0",
"assets/assets/images/pic23.jpg": "b0ac4a782d78b4592f90b313dc4c6131",
"assets/assets/images/pic37.jpg": "979236c0997f005ba5af120ff858de5d",
"assets/assets/images/pic5.jpg": "52499b132c1fffb2013093156df284d5",
"assets/assets/images/pic4.jpg": "3b32f967ae9a5ecd53967e2e87e619aa",
"assets/assets/images/pic36.jpg": "01a493639fe6ef2112b3365c0c3bf113",
"assets/assets/images/pic22.jpg": "8ac7f0b7eaff7c1be65f3c330e2e8290",
"assets/assets/images/sch.jpeg": "459e836674dc1a05d6942be51c205b3e",
"assets/assets/images/Siemenslogo.jpg": "60d5e96bbedbfa91ca9cb36160c8a7d2",
"assets/assets/images/pic45.jpg": "978d7da943385509302ee1c1beda2f91",
"assets/assets/images/pic51.jpg": "56603fa2ebbaa51167a9f6feea6c716a",
"assets/assets/images/homeimage.jpg": "f871d0ad0fac54c631b5be79ea194601",
"assets/assets/images/pic50.jpg": "037d856b7cd9a9e177758d829fa423f8",
"assets/assets/images/pic44.jpg": "5e893eda4350d7d2cdcef055ac4fa024",
"assets/assets/images/rui.jpeg": "78ba228466003c9b9152be42d3b3a611",
"assets/assets/images/homeimage.jpeg": "9bfc1d5e3e7583cb1aeaf937d6394761",
"assets/assets/images/pic52.jpg": "ec959b035367fdc8b6fe008b774f2d49",
"assets/assets/images/pic46.jpg": "2e81b6f296dae369601f90b0db03dcc6",
"assets/assets/images/twitter.svg": "28eded7dc4e384571a0ab383b1a67da7",
"assets/assets/images/spear.png": "5f5b1533a3e7a380218c513a6ded7588",
"assets/assets/images/azizta.jpg": "0375f4a758dfe3872d5f4721ffedb03b",
"assets/assets/images/pic47.jpg": "d8e51fb05288596e347cbcbb54c38145",
"assets/assets/images/pic53.jpg": "725b64cd12fa960aeda2b04930a6eb82",
"assets/assets/images/chemeca.png": "213d267f538a63fc218027aa9e3eafaf",
"assets/assets/images/pic57.jpg": "09fbeca01b7f4e4ed771a61967332002",
"assets/assets/images/pic43.jpg": "b6c95b4010f3ea4c8d77eeb3d68b196c",
"assets/assets/images/clians.jpg": "0569f1c16555d761bc229d933f7dd958",
"assets/assets/images/vertex.jpeg": "cec179100b3b0188b8bed7d8026c6f92",
"assets/assets/images/Zenara.jpg": "d81657da411298e917749e177c87e48b",
"assets/assets/images/pic42.jpg": "bfb21012421075d21bc4e333b82dcc67",
"assets/assets/images/pic56.jpg": "5d00415d831a197ecc03929e881fa128",
"assets/assets/images/virupaksha.jpg": "9cdab68f153bc1ef900ad60f762a6e7c",
"assets/assets/images/pic68.jpg": "833a9eb139821a4564db00ee42f80b92",
"assets/assets/images/pic40.jpg": "040698d080bb52421935385030ccd63e",
"assets/assets/images/pic54.jpg": "a874a79df7d450a52f1abf6b1c0adfec",
"assets/assets/images/pellets.png": "aabce14b83cf839f298c2340acdee112",
"assets/assets/images/htlt.jpeg": "1537dd546b3d80ce30d68a2a1d6fd12f",
"assets/assets/images/pic55.jpg": "85e6c4bb864c0bf502c1ed6031302eb2",
"assets/assets/images/pic41.jpg": "3cdee90d71762c58d743c7d0234f4eab",
"assets/assets/images/pic69.jpg": "6fc24cbb9d530487acaa2ab5ba02378e",
"assets/assets/images/close.png": "86cfb05276002c73a900ac534846d163",
"assets/assets/videos/video5.mp4": "b6b038bf694766d3c8c324d0b27513a9",
"assets/assets/videos/light.mp4": "88d1ff5e8d1af1317661e67e1f52e9ee",
"assets/assets/videos/video3.mp4": "7925642a1b43a3250c88fdc61e9e9a5a",
"assets/assets/videos/video2.mp4": "b37503edfd8e4c6bc36e238610e966de",
"assets/assets/videos/background.mp4": "d2ae95c1343df819151c28f36218b9b1",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
