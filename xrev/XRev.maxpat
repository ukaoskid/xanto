{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      80,
      80,
      760,
      560
    ],
    "bgcolor": [
      0.025,
      0.045,
      0.043,
      1
    ],
    "editing_bgcolor": [
      0.11,
      0.12,
      0.13,
      1
    ],
    "bglocked": 0,
    "openinpresentation": 1,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15,
      15
    ],
    "toolbarvisible": 1,
    "devicewidth": 530,
    "boxes": [
      {
        "box": {
          "id": "brand",
          "maxclass": "comment",
          "patching_rect": [
            20,
            20,
            100,
            24
          ],
          "text": "XREV",
          "fontsize": 18,
          "fontface": 1,
          "textcolor": [
            0.96,
            0.95,
            0.92,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            14,
            8,
            62,
            24
          ]
        }
      },
      {
        "box": {
          "id": "tag",
          "maxclass": "comment",
          "patching_rect": [
            100,
            20,
            230,
            24
          ],
          "text": "PER-EVENT REVERSE",
          "fontsize": 9,
          "textcolor": [
            0.58,
            0.6,
            0.64,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            76,
            12,
            155,
            18
          ]
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "live.drop",
          "patching_rect": [
            20,
            55,
            310,
            80
          ],
          "decodemode": 0,
          "fontsize": 12,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "varname": "source_drop",
          "rounded": 8,
          "bgcolor": [
            0.045,
            0.075,
            0.072,
            1
          ],
          "activebgcolor": [
            0.08,
            0.3,
            0.24,
            1
          ],
          "bordercolor": [
            0.18,
            0.39,
            0.34,
            1
          ],
          "textcolor": [
            0.96,
            0.95,
            0.92,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            14,
            36,
            294,
            53
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "Source Audio Drop",
              "parameter_shortname": "Source Drop",
              "parameter_modmode": 0,
              "parameter_type": 4
            }
          }
        }
      },
      {
        "box": {
          "id": "sourceLabel",
          "maxclass": "comment",
          "patching_rect": [
            20,
            140,
            310,
            20
          ],
          "text": "DROP AUDIO HERE",
          "fontsize": 8,
          "textcolor": [
            0.58,
            0.6,
            0.64,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            15,
            91,
            293,
            14
          ]
        }
      },
      {
        "box": {
          "id": "sensitivity",
          "maxclass": "live.dial",
          "patching_rect": [
            410,
            55,
            48,
            48
          ],
          "parameter_enable": 1,
          "varname": "sensitivity",
          "min": 0,
          "size": 100,
          "floatoutput": 1,
          "activebgcolor": [
            0.42,
            0.22,
            0.74,
            1
          ],
          "activeneedlecolor": [
            0.2,
            0.78,
            0.57,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            316,
            39,
            38,
            43
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Sensitivity",
              "parameter_shortname": "Sensitivity",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_units": "%",
              "parameter_unitstyle": 9,
              "parameter_steps": 101,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                62
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "sensitivityLabel",
          "maxclass": "comment",
          "patching_rect": [
            410,
            105,
            50,
            18
          ],
          "text": "SENSITIVITY",
          "fontsize": 7,
          "textjustification": 1,
          "textcolor": [
            0.58,
            0.6,
            0.64,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            311,
            82,
            48,
            14
          ]
        }
      },
      {
        "box": {
          "id": "sensitivityPrepend",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            140,
            100,
            22
          ],
          "text": "prepend sensitivity"
        }
      },
      {
        "box": {
          "id": "crossfade",
          "maxclass": "live.dial",
          "patching_rect": [
            466,
            55,
            48,
            48
          ],
          "parameter_enable": 1,
          "varname": "crossfade",
          "min": 0,
          "size": 250,
          "floatoutput": 1,
          "activebgcolor": [
            0.42,
            0.22,
            0.74,
            1
          ],
          "activeneedlecolor": [
            0.2,
            0.78,
            0.57,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            372,
            39,
            38,
            43
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Slice Fade",
              "parameter_shortname": "Slice Fade",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 250,
              "parameter_units": "ms",
              "parameter_unitstyle": 9,
              "parameter_steps": 251,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                18
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "crossfadeLabel",
          "maxclass": "comment",
          "patching_rect": [
            466,
            105,
            50,
            18
          ],
          "text": "SLICE FADE",
          "fontsize": 7,
          "textjustification": 1,
          "textcolor": [
            0.58,
            0.6,
            0.64,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            367,
            82,
            48,
            14
          ]
        }
      },
      {
        "box": {
          "id": "crossfadePrepend",
          "maxclass": "newobj",
          "patching_rect": [
            466,
            140,
            100,
            22
          ],
          "text": "prepend crossfade"
        }
      },
      {
        "box": {
          "id": "process",
          "maxclass": "live.text",
          "patching_rect": [
            20,
            175,
            120,
            40
          ],
          "text": "PROCESS",
          "texton": "PROCESS",
          "mode": 0,
          "parameter_enable": 0,
          "activebgcolor": [
            0.2,
            0.78,
            0.57,
            1
          ],
          "activebgoncolor": [
            0.35,
            0.95,
            0.7,
            1
          ],
          "textcolor": [
            0.03,
            0.08,
            0.07,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            14,
            117,
            105,
            32
          ]
        }
      },
      {
        "box": {
          "id": "preview",
          "maxclass": "live.text",
          "patching_rect": [
            150,
            175,
            100,
            40
          ],
          "text": "PREVIEW",
          "texton": "PREVIEW",
          "mode": 0,
          "parameter_enable": 0,
          "activebgcolor": [
            0.42,
            0.22,
            0.74,
            1
          ],
          "textcolor": [
            0.96,
            0.95,
            0.92,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            125,
            117,
            88,
            32
          ]
        }
      },
      {
        "box": {
          "id": "place",
          "maxclass": "live.text",
          "patching_rect": [
            260,
            175,
            100,
            40
          ],
          "text": "PLACE",
          "texton": "PLACE",
          "mode": 0,
          "parameter_enable": 0,
          "activebgcolor": [
            0.14,
            0.42,
            0.62,
            1
          ],
          "textcolor": [
            0.96,
            0.95,
            0.92,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            219,
            117,
            88,
            32
          ]
        }
      },
      {
        "box": {
          "id": "status",
          "maxclass": "comment",
          "patching_rect": [
            380,
            178,
            280,
            20
          ],
          "text": "DROP AN AUDIO CLIP",
          "fontsize": 8,
          "textcolor": [
            0.96,
            0.95,
            0.92,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            316,
            117,
            204,
            15
          ]
        }
      },
      {
        "box": {
          "id": "result",
          "maxclass": "comment",
          "patching_rect": [
            380,
            200,
            280,
            20
          ],
          "text": "NOT PROCESSED",
          "fontsize": 8,
          "textcolor": [
            0.58,
            0.6,
            0.64,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            316,
            135,
            204,
            14
          ]
        }
      },
      {
        "box": {
          "id": "dropRoute",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            250,
            75,
            22
          ],
          "text": "route none"
        }
      },
      {
        "box": {
          "id": "dropTrigger",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            280,
            55,
            22
          ],
          "text": "t s s"
        }
      },
      {
        "box": {
          "id": "replace",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            315,
            100,
            22
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "sourcePrepend",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            315,
            95,
            22
          ],
          "text": "prepend source"
        }
      },
      {
        "box": {
          "id": "sourceBuffer",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            355,
            190,
            22
          ],
          "text": "buffer~ xrev_source 1000 2"
        }
      },
      {
        "box": {
          "id": "renderBuffer",
          "maxclass": "newobj",
          "patching_rect": [
            235,
            355,
            190,
            22
          ],
          "text": "buffer~ xrev_render 1000 2"
        }
      },
      {
        "box": {
          "id": "writeDone",
          "maxclass": "newobj",
          "patching_rect": [
            435,
            355,
            115,
            22
          ],
          "text": "prepend write_done"
        }
      },
      {
        "box": {
          "id": "engine",
          "maxclass": "newobj",
          "patching_rect": [
            250,
            280,
            135,
            22
          ],
          "text": "js xrev_engine.js",
          "saved_object_attributes": {
            "filename": "xrev_engine.js",
            "parameter_enable": 0
          }
        }
      },
      {
        "box": {
          "id": "processMsg",
          "maxclass": "newobj",
          "patching_rect": [
            395,
            280,
            105,
            22
          ],
          "text": "prepend process"
        }
      },
      {
        "box": {
          "id": "previewMsg",
          "maxclass": "newobj",
          "patching_rect": [
            510,
            280,
            100,
            22
          ],
          "text": "prepend preview"
        }
      },
      {
        "box": {
          "id": "placeMsg",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            280,
            90,
            22
          ],
          "text": "prepend place"
        }
      },
      {
        "box": {
          "id": "play",
          "maxclass": "newobj",
          "patching_rect": [
            235,
            395,
            130,
            22
          ],
          "text": "play~ xrev_render 2"
        }
      },
      {
        "box": {
          "id": "gainL",
          "maxclass": "newobj",
          "patching_rect": [
            235,
            430,
            80,
            22
          ],
          "text": "*~ 0.8"
        }
      },
      {
        "box": {
          "id": "gainR",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            430,
            80,
            22
          ],
          "text": "*~ 0.8"
        }
      },
      {
        "box": {
          "id": "plugin",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            430,
            55,
            22
          ],
          "text": "plugin~"
        }
      },
      {
        "box": {
          "id": "out",
          "maxclass": "newobj",
          "patching_rect": [
            120,
            500,
            58,
            22
          ],
          "text": "plugout~"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "sensitivity",
            0
          ],
          "destination": [
            "sensitivityPrepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sensitivityPrepend",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "crossfade",
            0
          ],
          "destination": [
            "crossfadePrepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "crossfadePrepend",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drop",
            0
          ],
          "destination": [
            "dropRoute",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dropRoute",
            1
          ],
          "destination": [
            "dropTrigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dropTrigger",
            1
          ],
          "destination": [
            "replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "replace",
            0
          ],
          "destination": [
            "sourceBuffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dropTrigger",
            0
          ],
          "destination": [
            "sourcePrepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sourcePrepend",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            0
          ],
          "destination": [
            "renderBuffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "renderBuffer",
            1
          ],
          "destination": [
            "writeDone",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "writeDone",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            1
          ],
          "destination": [
            "play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            2
          ],
          "destination": [
            "status",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            3
          ],
          "destination": [
            "result",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            4
          ],
          "destination": [
            "sourceLabel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "process",
            0
          ],
          "destination": [
            "processMsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "processMsg",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "preview",
            0
          ],
          "destination": [
            "previewMsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "previewMsg",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "place",
            0
          ],
          "destination": [
            "placeMsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "placeMsg",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play",
            0
          ],
          "destination": [
            "gainL",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play",
            1
          ],
          "destination": [
            "gainR",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gainL",
            0
          ],
          "destination": [
            "out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gainR",
            0
          ],
          "destination": [
            "out",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "plugin",
            0
          ],
          "destination": [
            "out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "plugin",
            1
          ],
          "destination": [
            "out",
            1
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "xrev_engine.js",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
