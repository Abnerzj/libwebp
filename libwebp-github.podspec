{
  "name": "libwebp",
  "version": "1.2.0",
  "summary": "Library to encode and decode images in WebP format.",
  "homepage": "https://developers.google.com/speed/webp/",
  "authors": "Google Inc.",
  "license": {
    "type": "BSD",
    "file": "COPYING"
  },
  "source": {
    "git": "https://github.com/webmproject/libwebp.git",
    "tag": "v1.2.0"
  },
  "compiler_flags": "-D_THREAD_SAFE",
  "requires_arc": false,
  "platforms": {
    "osx": "10.10",
    "ios": "8.0",
    "tvos": "9.0",
    "watchos": "2.0"
  },
  "pod_target_xcconfig": {
    "USER_HEADER_SEARCH_PATHS": "$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/"
  },
  "preserve_paths": "src",
  "default_subspecs": [
    "webp",
    "demux",
    "mux"
  ],
  "prepare_command": "sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'",
  "subspecs": [
    {
      "name": "webp",
      "source_files": [
        "src/webp/decode.h",
        "src/webp/encode.h",
        "src/webp/types.h",
        "src/webp/mux_types.h",
        "src/webp/format_constants.h",
        "src/utils/*.{h,c}",
        "src/dsp/*.{h,c}",
        "src/dec/*.{h,c}",
        "src/enc/*.{h,c}"
      ],
      "public_header_files": [
        "src/webp/decode.h",
        "src/webp/encode.h",
        "src/webp/types.h",
        "src/webp/mux_types.h",
        "src/webp/format_constants.h"
      ]
    },
    {
      "name": "demux",
      "dependencies": {
        "libwebp/webp": [

        ]
      },
      "source_files": [
        "src/demux/*.{h,c}",
        "src/webp/demux.h"
      ],
      "public_header_files": "src/webp/demux.h"
    },
    {
      "name": "mux",
      "dependencies": {
        "libwebp/demux": [

        ]
      },
      "source_files": [
        "src/mux/*.{h,c}",
        "src/webp/mux.h"
      ],
      "public_header_files": "src/webp/mux.h"
    }
  ]
}
