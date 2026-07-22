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
      0.055,
      0.035,
      0.075,
      1
    ],
    "editing_bgcolor": [
      0.12,
      0.11,
      0.14,
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
            120,
            25
          ],
          "text": "XPRE",
          "fontsize": 18,
          "fontface": 1,
          "textcolor": [
            1,
            0.94,
            0.88,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            14,
            8,
            74,
            24
          ]
        }
      },
      {
        "box": {
          "id": "tag",
          "maxclass": "comment",
          "patching_rect": [
            130,
            20,
            260,
            25
          ],
          "text": "ANTICIPATION CONSTRUCTOR",
          "fontsize": 9,
          "textcolor": [
            0.62,
            0.56,
            0.68,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            80,
            12,
            180,
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
            0.095,
            0.06,
            0.13,
            1
          ],
          "activebgcolor": [
            0.22,
            0.08,
            0.34,
            1
          ],
          "bordercolor": [
            0.36,
            0.22,
            0.46,
            1
          ],
          "textcolor": [
            1,
            0.94,
            0.88,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            14,
            36,
            300,
            55
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "Source Audio Drop",
              "parameter_modmode": 0,
              "parameter_shortname": "Source Drop",
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
          "text": "NO SOURCE",
          "fontsize": 8,
          "textcolor": [
            0.62,
            0.56,
            0.68,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            15,
            93,
            299,
            14
          ]
        }
      },
      {
        "box": {
          "id": "reverb",
          "maxclass": "live.dial",
          "patching_rect": [
            434,
            55,
            48,
            48
          ],
          "parameter_enable": 1,
          "varname": "reverb",
          "min": 0,
          "size": 100,
          "floatoutput": 1,
          "activebgcolor": [
            0.22,
            0.08,
            0.34,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.08,
            0.16,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            340,
            39,
            38,
            43
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Reverb",
              "parameter_shortname": "REVERB",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_units": "%d%",
              "parameter_unitstyle": 9,
              "parameter_steps": 101,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                65
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "reverbLabel",
          "maxclass": "comment",
          "patching_rect": [
            434,
            105,
            48,
            18
          ],
          "text": "REVERB",
          "fontsize": 7,
          "textjustification": 1,
          "textcolor": [
            0.62,
            0.56,
            0.68,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            338,
            82,
            42,
            14
          ]
        }
      },
      {
        "box": {
          "id": "reverbPrepend",
          "maxclass": "newobj",
          "patching_rect": [
            434,
            140,
            80,
            22
          ],
          "text": "prepend reverb"
        }
      },
      {
        "box": {
          "id": "mix",
          "maxclass": "live.dial",
          "patching_rect": [
            484,
            55,
            48,
            48
          ],
          "parameter_enable": 1,
          "varname": "mix",
          "min": 0,
          "size": 100,
          "floatoutput": 1,
          "activebgcolor": [
            0.22,
            0.08,
            0.34,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.08,
            0.16,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            390,
            39,
            38,
            43
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Mix",
              "parameter_shortname": "MIX",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_units": "%d%",
              "parameter_unitstyle": 9,
              "parameter_steps": 101,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                65
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "mixLabel",
          "maxclass": "comment",
          "patching_rect": [
            484,
            105,
            48,
            18
          ],
          "text": "MIX",
          "fontsize": 7,
          "textjustification": 1,
          "textcolor": [
            0.62,
            0.56,
            0.68,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            388,
            82,
            42,
            14
          ]
        }
      },
      {
        "box": {
          "id": "mixPrepend",
          "maxclass": "newobj",
          "patching_rect": [
            484,
            140,
            80,
            22
          ],
          "text": "prepend mix"
        }
      },
      {
        "box": {
          "id": "generate",
          "maxclass": "live.text",
          "patching_rect": [
            20,
            175,
            125,
            40
          ],
          "text": "GENERATE",
          "texton": "GENERATE",
          "mode": 0,
          "parameter_enable": 0,
          "activebgcolor": [
            0.95,
            0.08,
            0.16,
            1
          ],
          "activebgoncolor": [
            1,
            0.25,
            0.22,
            1
          ],
          "textcolor": [
            1,
            0.94,
            0.88,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            14,
            119,
            112,
            32
          ]
        }
      },
      {
        "box": {
          "id": "preview",
          "maxclass": "live.text",
          "patching_rect": [
            155,
            175,
            100,
            40
          ],
          "text": "PREVIEW",
          "texton": "PREVIEW",
          "mode": 0,
          "parameter_enable": 0,
          "activebgcolor": [
            0.22,
            0.08,
            0.34,
            1
          ],
          "textcolor": [
            1,
            0.94,
            0.88,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            132,
            119,
            92,
            32
          ]
        }
      },
      {
        "box": {
          "id": "place",
          "maxclass": "live.text",
          "patching_rect": [
            265,
            175,
            100,
            40
          ],
          "text": "PLACE",
          "texton": "PLACE",
          "mode": 0,
          "parameter_enable": 0,
          "activebgcolor": [
            0.15,
            0.38,
            0.3,
            1
          ],
          "textcolor": [
            1,
            0.94,
            0.88,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            230,
            119,
            92,
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
            320,
            20
          ],
          "text": "DROP SOURCE AUDIO",
          "fontsize": 8,
          "textcolor": [
            1,
            0.94,
            0.88,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            332,
            119,
            187,
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
            320,
            20
          ],
          "text": "NO PRE-REVERB",
          "fontsize": 8,
          "textcolor": [
            0.62,
            0.56,
            0.68,
            1
          ],
          "presentation": 1,
          "presentation_rect": [
            332,
            137,
            187,
            14
          ]
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
            185,
            22
          ],
          "text": "buffer~ xpre_source 1000 2"
        }
      },
      {
        "box": {
          "id": "renderBuffer",
          "maxclass": "newobj",
          "patching_rect": [
            235,
            355,
            185,
            22
          ],
          "text": "buffer~ xpre_render 1000 2"
        }
      },
      {
        "box": {
          "id": "writeDone",
          "maxclass": "newobj",
          "patching_rect": [
            430,
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
            130,
            22
          ],
          "text": "js xpre_engine.js",
          "saved_object_attributes": {
            "filename": "xpre_engine.js",
            "parameter_enable": 0
          }
        }
      },
      {
        "box": {
          "id": "generateMsg",
          "maxclass": "newobj",
          "patching_rect": [
            390,
            280,
            105,
            22
          ],
          "text": "prepend generate"
        }
      },
      {
        "box": {
          "id": "previewMsg",
          "maxclass": "newobj",
          "patching_rect": [
            505,
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
            615,
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
          "text": "play~ xpre_render 2"
        }
      },
      {
        "box": {
          "id": "gain",
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
            "reverb",
            0
          ],
          "destination": [
            "reverbPrepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbPrepend",
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
            "mix",
            0
          ],
          "destination": [
            "mixPrepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mixPrepend",
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
            "generate",
            0
          ],
          "destination": [
            "generateMsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "generateMsg",
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
            "gain",
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
            "gain",
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
        "name": "xpre_engine.js",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
