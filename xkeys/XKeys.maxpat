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
      70,
      70,
      1120,
      720
    ],
    "openrect": [
      0,
      0,
      420,
      169
    ],
    "openinpresentation": 1,
    "bgcolor": [
      0.035,
      0.027,
      0.055,
      1
    ],
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "text": "X  K  E  Y  S",
          "fontsize": 17,
          "fontface": 1,
          "textcolor": [
            0.96,
            0.14,
            0.22,
            1
          ],
          "patching_rect": [
            40,
            35,
            150,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            18,
            12,
            150,
            24
          ]
        }
      },
      {
        "box": {
          "id": "subtitle",
          "maxclass": "comment",
          "text": "NO WAY BACK",
          "fontsize": 8,
          "tracking": 2,
          "textcolor": [
            0.55,
            0.47,
            0.65,
            1
          ],
          "patching_rect": [
            40,
            60,
            110,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            36,
            110,
            18
          ]
        }
      },
      {
        "box": {
          "id": "generate",
          "maxclass": "live.text",
          "text": "GENERATE",
          "texton": "GENERATE",
          "mode": 0,
          "parameter_enable": 0,
          "patching_rect": [
            40,
            90,
            120,
            42
          ],
          "presentation": 1,
          "presentation_rect": [
            18,
            67,
            118,
            42
          ],
          "activebgcolor": [
            0.95,
            0.08,
            0.14,
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
            0.9,
            1
          ]
        }
      },
      {
        "box": {
          "id": "name",
          "maxclass": "message",
          "text": "FELT  ·  000000",
          "fontsize": 8,
          "textcolor": [
            0.85,
            0.7,
            0.92,
            1
          ],
          "bgcolor": [
            0.06,
            0.045,
            0.085,
            1
          ],
          "patching_rect": [
            40,
            140,
            190,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            18,
            121,
            118,
            20
          ]
        }
      },
      {
        "box": {
          "id": "attack",
          "maxclass": "live.dial",
          "parameter_enable": 1,
          "varname": "attack",
          "patching_rect": [
            150,
            60,
            48,
            48
          ],
          "presentation": 1,
          "presentation_rect": [
            137,
            47,
            42,
            48
          ],
          "min": 0,
          "size": 10000,
          "floatoutput": 1,
          "activebgcolor": [
            0.27,
            0.12,
            0.45,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.12,
            0.24,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Attack",
              "parameter_shortname": "Attack",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 10000,
              "parameter_units": "%.0f ms",
              "parameter_unitstyle": 9,
              "parameter_steps": 0,
              "parameter_exponent": 3,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                5
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "attack-label",
          "maxclass": "comment",
          "text": "ATTACK",
          "fontsize": 8,
          "textcolor": [
            0.75,
            0.67,
            0.82,
            1
          ],
          "patching_rect": [
            150,
            112,
            60,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            134,
            101,
            48,
            18
          ]
        }
      },
      {
        "box": {
          "id": "release",
          "maxclass": "live.dial",
          "parameter_enable": 1,
          "varname": "release",
          "patching_rect": [
            230,
            60,
            48,
            48
          ],
          "presentation": 1,
          "presentation_rect": [
            184,
            47,
            42,
            48
          ],
          "min": 0,
          "size": 10000,
          "floatoutput": 1,
          "activebgcolor": [
            0.27,
            0.12,
            0.45,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.12,
            0.24,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Release",
              "parameter_shortname": "Release",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 10000,
              "parameter_units": "%.0f ms",
              "parameter_unitstyle": 9,
              "parameter_steps": 0,
              "parameter_exponent": 3,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1200
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "release-label",
          "maxclass": "comment",
          "text": "RELEASE",
          "fontsize": 8,
          "textcolor": [
            0.75,
            0.67,
            0.82,
            1
          ],
          "patching_rect": [
            230,
            112,
            60,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            180,
            101,
            50,
            18
          ]
        }
      },
      {
        "box": {
          "id": "filter",
          "maxclass": "live.dial",
          "parameter_enable": 1,
          "varname": "filter",
          "patching_rect": [
            270,
            60,
            48,
            48
          ],
          "presentation": 1,
          "presentation_rect": [
            231,
            47,
            42,
            48
          ],
          "min": 80,
          "size": 11920,
          "floatoutput": 1,
          "activebgcolor": [
            0.27,
            0.12,
            0.45,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.12,
            0.24,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Filter",
              "parameter_shortname": "Filter",
              "parameter_type": 0,
              "parameter_mmin": 80,
              "parameter_mmax": 12000,
              "parameter_units": "%.0f Hz",
              "parameter_unitstyle": 9,
              "parameter_steps": 0,
              "parameter_exponent": 3,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                4800
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "filter-label",
          "maxclass": "comment",
          "text": "FILTER",
          "fontsize": 8,
          "textcolor": [
            0.75,
            0.67,
            0.82,
            1
          ],
          "patching_rect": [
            270,
            112,
            60,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            229,
            101,
            46,
            18
          ]
        }
      },
      {
        "box": {
          "id": "chorus",
          "maxclass": "live.dial",
          "parameter_enable": 1,
          "varname": "chorus",
          "patching_rect": [
            310,
            60,
            48,
            48
          ],
          "presentation": 1,
          "presentation_rect": [
            278,
            47,
            42,
            48
          ],
          "min": 0,
          "size": 100,
          "floatoutput": 1,
          "activebgcolor": [
            0.27,
            0.12,
            0.45,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.12,
            0.24,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Chorus",
              "parameter_shortname": "Chorus",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_units": "%d%",
              "parameter_unitstyle": 9,
              "parameter_steps": 101,
              "parameter_exponent": 1,
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
          "id": "chorus-label",
          "maxclass": "comment",
          "text": "CHORUS",
          "fontsize": 8,
          "textcolor": [
            0.75,
            0.67,
            0.82,
            1
          ],
          "patching_rect": [
            310,
            112,
            60,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            274,
            101,
            50,
            18
          ]
        }
      },
      {
        "box": {
          "id": "drive",
          "maxclass": "live.dial",
          "parameter_enable": 1,
          "varname": "drive",
          "patching_rect": [
            390,
            60,
            48,
            48
          ],
          "presentation": 1,
          "presentation_rect": [
            325,
            47,
            42,
            48
          ],
          "min": 0,
          "size": 100,
          "floatoutput": 1,
          "activebgcolor": [
            0.27,
            0.12,
            0.45,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.12,
            0.24,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Drive",
              "parameter_shortname": "Drive",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_units": "%d%",
              "parameter_unitstyle": 9,
              "parameter_steps": 101,
              "parameter_exponent": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                8
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "drive-label",
          "maxclass": "comment",
          "text": "DRIVE",
          "fontsize": 8,
          "textcolor": [
            0.75,
            0.67,
            0.82,
            1
          ],
          "patching_rect": [
            390,
            112,
            60,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            324,
            101,
            44,
            18
          ]
        }
      },
      {
        "box": {
          "id": "reverb",
          "maxclass": "live.dial",
          "parameter_enable": 1,
          "varname": "reverb",
          "patching_rect": [
            470,
            60,
            48,
            48
          ],
          "presentation": 1,
          "presentation_rect": [
            372,
            47,
            42,
            48
          ],
          "min": 0,
          "size": 100,
          "floatoutput": 1,
          "activebgcolor": [
            0.27,
            0.12,
            0.45,
            1
          ],
          "activeneedlecolor": [
            0.95,
            0.12,
            0.24,
            1
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Reverb",
              "parameter_shortname": "Reverb",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_units": "%d%",
              "parameter_unitstyle": 9,
              "parameter_steps": 101,
              "parameter_exponent": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                25
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "reverb-label",
          "maxclass": "comment",
          "text": "REVERB",
          "fontsize": 8,
          "textcolor": [
            0.75,
            0.67,
            0.82,
            1
          ],
          "patching_rect": [
            470,
            112,
            60,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            368,
            101,
            50,
            18
          ]
        }
      },
      {
        "box": {
          "id": "notein",
          "maxclass": "newobj",
          "text": "notein",
          "patching_rect": [
            40,
            230,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "pack",
          "maxclass": "newobj",
          "text": "pack 0 0",
          "patching_rect": [
            40,
            275,
            65,
            22
          ]
        }
      },
      {
        "box": {
          "id": "midinote",
          "maxclass": "newobj",
          "text": "prepend midinote",
          "patching_rect": [
            40,
            315,
            105,
            22
          ]
        }
      },
      {
        "box": {
          "id": "poly",
          "maxclass": "newobj",
          "text": "poly~ xkeys_voice 8 @steal 1",
          "patching_rect": [
            40,
            370,
            175,
            22
          ]
        }
      },
      {
        "box": {
          "id": "trim",
          "maxclass": "newobj",
          "text": "*~ 0.16",
          "patching_rect": [
            40,
            420,
            55,
            22
          ]
        }
      },
      {
        "box": {
          "id": "chorusfx",
          "maxclass": "newobj",
          "text": "abl.dsp.chorus~ @mix 0.32 @rate 0.16 @mod 0.38 @width 0.8 @warmth 0.45",
          "patching_rect": [
            40,
            465,
            440,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivefx",
          "maxclass": "newobj",
          "text": "abl.dsp.overdrive~ @mix 0.12 @gain 0.32 @bass 0.5 @mid 0.46 @treble 0.42",
          "patching_rect": [
            40,
            510,
            440,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reverbfx",
          "maxclass": "newobj",
          "text": "abl.dsp.darkhall~ @mix 0.42 @decay 0.76 @size 0.72 @damping 0.58 @mod 0.3",
          "patching_rect": [
            40,
            555,
            455,
            22
          ]
        }
      },
      {
        "box": {
          "id": "out",
          "maxclass": "newobj",
          "text": "plugout~",
          "patching_rect": [
            40,
            610,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "js",
          "maxclass": "newobj",
          "text": "js xkeys_generate.js",
          "patching_rect": [
            610,
            230,
            125,
            22
          ],
          "saved_object_attributes": {
            "filename": "xkeys_generate.js",
            "parameter_enable": 0
          }
        }
      },
      {
        "box": {
          "id": "target",
          "maxclass": "message",
          "text": "target 0",
          "patching_rect": [
            780,
            270,
            55,
            22
          ]
        }
      },
      {
        "box": {
          "id": "load",
          "maxclass": "newobj",
          "text": "loadbang",
          "patching_rect": [
            780,
            230,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "loadorder",
          "maxclass": "newobj",
          "text": "t b b",
          "patching_rect": [
            780,
            305,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "initdelay",
          "maxclass": "newobj",
          "text": "delay 500",
          "patching_rect": [
            710,
            270,
            65,
            22
          ]
        }
      },
      {
        "box": {
          "id": "thisdevice",
          "maxclass": "newobj",
          "text": "live.thisdevice",
          "patching_rect": [
            880,
            230,
            90,
            22
          ]
        }
      },
      {
        "box": {
          "id": "attackmsg",
          "maxclass": "message",
          "text": "target 0, attack $1",
          "patching_rect": [
            500,
            315,
            120,
            22
          ]
        }
      },
      {
        "box": {
          "id": "releasemsg",
          "maxclass": "message",
          "text": "target 0, release $1",
          "patching_rect": [
            630,
            315,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "filtermsg",
          "maxclass": "message",
          "text": "target 0, cutoff $1",
          "patching_rect": [
            760,
            315,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "chorusmsg",
          "maxclass": "newobj",
          "text": "prepend mix",
          "patching_rect": [
            610,
            420,
            78,
            22
          ]
        }
      },
      {
        "box": {
          "id": "chorusnorm",
          "maxclass": "newobj",
          "text": "/ 100.",
          "patching_rect": [
            550,
            420,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivemsg",
          "maxclass": "newobj",
          "text": "prepend mix",
          "patching_rect": [
            700,
            465,
            78,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivenorm",
          "maxclass": "newobj",
          "text": "/ 100.",
          "patching_rect": [
            640,
            420,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivegain",
          "maxclass": "newobj",
          "text": "scale 0. 100. 0.05 0.75",
          "patching_rect": [
            700,
            420,
            150,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivegainmsg",
          "maxclass": "newobj",
          "text": "prepend gain",
          "patching_rect": [
            800,
            465,
            85,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reverbnorm",
          "maxclass": "newobj",
          "text": "/ 100.",
          "patching_rect": [
            830,
            510,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reverbmsg",
          "maxclass": "newobj",
          "text": "prepend mix",
          "patching_rect": [
            890,
            510,
            78,
            22
          ]
        }
      },
      {
        "box": {
          "id": "releasedecayscale",
          "maxclass": "newobj",
          "text": "scale 0. 10000. 0.08 0.94",
          "patching_rect": [
            600,
            555,
            165,
            22
          ]
        }
      },
      {
        "box": {
          "id": "releasedecaymsg",
          "maxclass": "newobj",
          "text": "prepend decay",
          "patching_rect": [
            780,
            555,
            90,
            22
          ]
        }
      },
      {
        "box": {
          "id": "effectroute",
          "maxclass": "newobj",
          "text": "route chorus_rate chorus_mod chorus_width reverb_size reverb_damping reverb_mod drive_bass drive_treble",
          "patching_rect": [
            545,
            600,
            600,
            22
          ]
        }
      },
      {
        "box": {
          "id": "chorusrate",
          "maxclass": "newobj",
          "text": "prepend rate",
          "patching_rect": [
            545,
            635,
            82,
            22
          ]
        }
      },
      {
        "box": {
          "id": "chorusmod",
          "maxclass": "newobj",
          "text": "prepend mod",
          "patching_rect": [
            635,
            635,
            82,
            22
          ]
        }
      },
      {
        "box": {
          "id": "choruswidth",
          "maxclass": "newobj",
          "text": "prepend width",
          "patching_rect": [
            725,
            635,
            88,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reverbsize",
          "maxclass": "newobj",
          "text": "prepend size",
          "patching_rect": [
            545,
            670,
            82,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reverbdamping",
          "maxclass": "newobj",
          "text": "prepend damping",
          "patching_rect": [
            635,
            670,
            112,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reverbmod",
          "maxclass": "newobj",
          "text": "prepend mod",
          "patching_rect": [
            755,
            670,
            82,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivebass",
          "maxclass": "newobj",
          "text": "prepend bass",
          "patching_rect": [
            845,
            635,
            85,
            22
          ]
        }
      },
      {
        "box": {
          "id": "drivetreble",
          "maxclass": "newobj",
          "text": "prepend treble",
          "patching_rect": [
            940,
            635,
            92,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voicestateroute",
          "maxclass": "newobj",
          "text": "route wave_mode filter_mode osc_mix sub_mix noise_mix octave detune resonance decay sustain drift_rate drift_depth fm_ratio fm_amount fm_mix",
          "patching_rect": [
            500,
            705,
            920,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-wave",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_wave",
          "min": 1,
          "size": 2,
          "floatoutput": 0,
          "patching_rect": [
            500,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Wave",
              "parameter_shortname": "StWave",
              "parameter_type": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 3,
              "parameter_steps": 3,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                2
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-filtermode",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_filtermode",
          "min": 1,
          "size": 3,
          "floatoutput": 0,
          "patching_rect": [
            550,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Filter Mode",
              "parameter_shortname": "StFilter",
              "parameter_type": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 4,
              "parameter_steps": 4,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-osc",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_osc",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            600,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Osc",
              "parameter_shortname": "StOsc",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.26
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-sub",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_sub",
          "min": 0,
          "size": 0.5,
          "floatoutput": 1,
          "patching_rect": [
            650,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Sub",
              "parameter_shortname": "StSub",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 0.5,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.04
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-noise",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_noise",
          "min": 0,
          "size": 0.25,
          "floatoutput": 1,
          "patching_rect": [
            700,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Noise",
              "parameter_shortname": "StNoise",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 0.25,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.035
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-octave",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_octave",
          "min": 0.5,
          "size": 0.5,
          "floatoutput": 1,
          "patching_rect": [
            750,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Octave",
              "parameter_shortname": "StOct",
              "parameter_type": 0,
              "parameter_mmin": 0.5,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-detune",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_detune",
          "min": 0.4,
          "size": 4.7,
          "floatoutput": 1,
          "patching_rect": [
            800,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Ratio",
              "parameter_shortname": "StRatio",
              "parameter_type": 0,
              "parameter_mmin": 0.4,
              "parameter_mmax": 5.1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                2
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-resonance",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_resonance",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            850,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Resonance",
              "parameter_shortname": "StRes",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.28
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-decay",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_decay",
          "min": 0,
          "size": 10000,
          "floatoutput": 1,
          "patching_rect": [
            900,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Decay",
              "parameter_shortname": "StDecay",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 10000,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                900
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-sustain",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_sustain",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            950,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Sustain",
              "parameter_shortname": "StSus",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.28
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-driftrate",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_driftrate",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            1000,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Drift Rate",
              "parameter_shortname": "StDriftR",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.035
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-driftdepth",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_driftdepth",
          "min": 0,
          "size": 1200,
          "floatoutput": 1,
          "patching_rect": [
            1050,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Drift Depth",
              "parameter_shortname": "StDriftD",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1200,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                90
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-fmratio",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_fmratio",
          "min": 0.1,
          "size": 7.9,
          "floatoutput": 1,
          "patching_rect": [
            1100,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State FM Ratio",
              "parameter_shortname": "StFMR",
              "parameter_type": 0,
              "parameter_mmin": 0.1,
              "parameter_mmax": 8,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                2
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-fmamount",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_fmamount",
          "min": 0,
          "size": 200,
          "floatoutput": 1,
          "patching_rect": [
            1150,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State FM Amount",
              "parameter_shortname": "StFMA",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 200,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                42
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-fmmix",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_fmmix",
          "min": 0,
          "size": 0.5,
          "floatoutput": 1,
          "patching_rect": [
            1200,
            740,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State FM Mix",
              "parameter_shortname": "StFMM",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 0.5,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.18
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-chorusrate",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_chorusrate",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            500,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Chorus Rate",
              "parameter_shortname": "StChRate",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.2
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-chorusmod",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_chorusmod",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            550,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Chorus Mod",
              "parameter_shortname": "StChMod",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.3
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-choruswidth",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_choruswidth",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            600,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Chorus Width",
              "parameter_shortname": "StChWidth",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.72
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-reverbsize",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_reverbsize",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            650,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Reverb Size",
              "parameter_shortname": "StRvSize",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.55
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-reverbdamping",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_reverbdamping",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            700,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Reverb Damping",
              "parameter_shortname": "StRvDamp",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.62
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-reverbmod",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_reverbmod",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            750,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Reverb Mod",
              "parameter_shortname": "StRvMod",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.12
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-drivebass",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_drivebass",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            800,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Drive Bass",
              "parameter_shortname": "StDrBass",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.45
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-drivetreble",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_drivetreble",
          "min": 0,
          "size": 1,
          "floatoutput": 1,
          "patching_rect": [
            850,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Drive Treble",
              "parameter_shortname": "StDrTreb",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.58
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-category",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_category",
          "min": 0,
          "size": 11,
          "floatoutput": 0,
          "patching_rect": [
            900,
            780,
            45,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Category",
              "parameter_shortname": "StCat",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 11,
              "parameter_steps": 12,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-signature",
          "maxclass": "live.numbox",
          "parameter_enable": 1,
          "varname": "state_signature",
          "min": 0,
          "size": 16777215,
          "floatoutput": 0,
          "patching_rect": [
            950,
            780,
            70,
            22
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "State Signature",
              "parameter_shortname": "StSig",
              "parameter_type": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 16777215,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 1
            }
          }
        }
      },
      {
        "box": {
          "id": "state-titlepak",
          "maxclass": "newobj",
          "text": "pak 0 0",
          "patching_rect": [
            1030,
            780,
            65,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-titlemsg",
          "maxclass": "newobj",
          "text": "prepend restore",
          "patching_rect": [
            1105,
            780,
            100,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-wave-msg",
          "maxclass": "newobj",
          "text": "prepend wave_mode",
          "patching_rect": [
            500,
            815,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-filtermode-msg",
          "maxclass": "newobj",
          "text": "prepend filter_mode",
          "patching_rect": [
            630,
            815,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-osc-msg",
          "maxclass": "newobj",
          "text": "prepend osc_mix",
          "patching_rect": [
            760,
            815,
            105,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-sub-msg",
          "maxclass": "newobj",
          "text": "prepend sub_mix",
          "patching_rect": [
            870,
            815,
            105,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-noise-msg",
          "maxclass": "newobj",
          "text": "prepend noise_mix",
          "patching_rect": [
            980,
            815,
            110,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-octave-msg",
          "maxclass": "newobj",
          "text": "prepend octave",
          "patching_rect": [
            1095,
            815,
            100,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-detune-msg",
          "maxclass": "newobj",
          "text": "prepend detune",
          "patching_rect": [
            500,
            845,
            100,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-resonance-msg",
          "maxclass": "newobj",
          "text": "prepend resonance",
          "patching_rect": [
            605,
            845,
            115,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-decay-msg",
          "maxclass": "newobj",
          "text": "prepend decay",
          "patching_rect": [
            725,
            845,
            95,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-sustain-msg",
          "maxclass": "newobj",
          "text": "prepend sustain",
          "patching_rect": [
            825,
            845,
            100,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-driftrate-msg",
          "maxclass": "newobj",
          "text": "prepend drift_rate",
          "patching_rect": [
            930,
            845,
            120,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-driftdepth-msg",
          "maxclass": "newobj",
          "text": "prepend drift_depth",
          "patching_rect": [
            1055,
            845,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-fmratio-msg",
          "maxclass": "newobj",
          "text": "prepend fm_ratio",
          "patching_rect": [
            500,
            875,
            115,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-fmamount-msg",
          "maxclass": "newobj",
          "text": "prepend fm_amount",
          "patching_rect": [
            620,
            875,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "state-fmmix-msg",
          "maxclass": "newobj",
          "text": "prepend fm_mix",
          "patching_rect": [
            750,
            875,
            105,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "notein",
            0
          ],
          "destination": [
            "pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "notein",
            1
          ],
          "destination": [
            "pack",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pack",
            0
          ],
          "destination": [
            "midinote",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "midinote",
            0
          ],
          "destination": [
            "poly",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "poly",
            0
          ],
          "destination": [
            "trim",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "trim",
            0
          ],
          "destination": [
            "chorusfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "trim",
            0
          ],
          "destination": [
            "chorusfx",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorusfx",
            0
          ],
          "destination": [
            "drivefx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorusfx",
            1
          ],
          "destination": [
            "drivefx",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivefx",
            0
          ],
          "destination": [
            "reverbfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivefx",
            1
          ],
          "destination": [
            "reverbfx",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbfx",
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
            "reverbfx",
            1
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
            "generate",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            0
          ],
          "destination": [
            "voicestateroute",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            1
          ],
          "destination": [
            "name",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            4
          ],
          "destination": [
            "filter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            5
          ],
          "destination": [
            "effectroute",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            6
          ],
          "destination": [
            "state-category",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            7
          ],
          "destination": [
            "state-signature",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load",
            0
          ],
          "destination": [
            "loadorder",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loadorder",
            1
          ],
          "destination": [
            "target",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loadorder",
            0
          ],
          "destination": [
            "initdelay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "target",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "attack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "release",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "filter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "chorus",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "drive",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "reverb",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-wave",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-filtermode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-osc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-sub",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-noise",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-octave",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-detune",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-resonance",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-decay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-sustain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-driftrate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-driftdepth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-fmratio",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-fmamount",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-fmmix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-chorusrate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-chorusmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-choruswidth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-reverbsize",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-reverbdamping",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-reverbmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-drivebass",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-drivetreble",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-category",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initdelay",
            0
          ],
          "destination": [
            "state-signature",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "attack",
            0
          ],
          "destination": [
            "attackmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "attackmsg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "release",
            0
          ],
          "destination": [
            "releasemsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "releasemsg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "filter",
            0
          ],
          "destination": [
            "filtermsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "filtermsg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "release",
            0
          ],
          "destination": [
            "releasedecayscale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "releasedecayscale",
            0
          ],
          "destination": [
            "releasedecaymsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "releasedecaymsg",
            0
          ],
          "destination": [
            "reverbfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorus",
            0
          ],
          "destination": [
            "chorusnorm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorusnorm",
            0
          ],
          "destination": [
            "chorusmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorusmsg",
            0
          ],
          "destination": [
            "chorusfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drive",
            0
          ],
          "destination": [
            "drivenorm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivenorm",
            0
          ],
          "destination": [
            "drivemsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drive",
            0
          ],
          "destination": [
            "drivegain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivemsg",
            0
          ],
          "destination": [
            "drivefx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivegain",
            0
          ],
          "destination": [
            "drivegainmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivegainmsg",
            0
          ],
          "destination": [
            "drivefx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverb",
            0
          ],
          "destination": [
            "reverbnorm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbnorm",
            0
          ],
          "destination": [
            "reverbmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbmsg",
            0
          ],
          "destination": [
            "reverbfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            0
          ],
          "destination": [
            "state-chorusrate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            1
          ],
          "destination": [
            "state-chorusmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            2
          ],
          "destination": [
            "state-choruswidth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            3
          ],
          "destination": [
            "state-reverbsize",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            4
          ],
          "destination": [
            "state-reverbdamping",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            5
          ],
          "destination": [
            "state-reverbmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            6
          ],
          "destination": [
            "state-drivebass",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "effectroute",
            7
          ],
          "destination": [
            "state-drivetreble",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-chorusrate",
            0
          ],
          "destination": [
            "chorusrate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-chorusmod",
            0
          ],
          "destination": [
            "chorusmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-choruswidth",
            0
          ],
          "destination": [
            "choruswidth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-reverbsize",
            0
          ],
          "destination": [
            "reverbsize",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-reverbdamping",
            0
          ],
          "destination": [
            "reverbdamping",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-reverbmod",
            0
          ],
          "destination": [
            "reverbmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-drivebass",
            0
          ],
          "destination": [
            "drivebass",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-drivetreble",
            0
          ],
          "destination": [
            "drivetreble",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorusrate",
            0
          ],
          "destination": [
            "chorusfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chorusmod",
            0
          ],
          "destination": [
            "chorusfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "choruswidth",
            0
          ],
          "destination": [
            "chorusfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbsize",
            0
          ],
          "destination": [
            "reverbfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbdamping",
            0
          ],
          "destination": [
            "reverbfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reverbmod",
            0
          ],
          "destination": [
            "reverbfx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivebass",
            0
          ],
          "destination": [
            "drivefx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "drivetreble",
            0
          ],
          "destination": [
            "drivefx",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            0
          ],
          "destination": [
            "state-wave",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            1
          ],
          "destination": [
            "state-filtermode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            2
          ],
          "destination": [
            "state-osc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            3
          ],
          "destination": [
            "state-sub",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            4
          ],
          "destination": [
            "state-noise",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            5
          ],
          "destination": [
            "state-octave",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            6
          ],
          "destination": [
            "state-detune",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            7
          ],
          "destination": [
            "state-resonance",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            8
          ],
          "destination": [
            "state-decay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            9
          ],
          "destination": [
            "state-sustain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            10
          ],
          "destination": [
            "state-driftrate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            11
          ],
          "destination": [
            "state-driftdepth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            12
          ],
          "destination": [
            "state-fmratio",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            13
          ],
          "destination": [
            "state-fmamount",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voicestateroute",
            14
          ],
          "destination": [
            "state-fmmix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-wave",
            0
          ],
          "destination": [
            "state-wave-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-filtermode",
            0
          ],
          "destination": [
            "state-filtermode-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-osc",
            0
          ],
          "destination": [
            "state-osc-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-sub",
            0
          ],
          "destination": [
            "state-sub-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-noise",
            0
          ],
          "destination": [
            "state-noise-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-octave",
            0
          ],
          "destination": [
            "state-octave-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-detune",
            0
          ],
          "destination": [
            "state-detune-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-resonance",
            0
          ],
          "destination": [
            "state-resonance-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-decay",
            0
          ],
          "destination": [
            "state-decay-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-sustain",
            0
          ],
          "destination": [
            "state-sustain-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-driftrate",
            0
          ],
          "destination": [
            "state-driftrate-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-driftdepth",
            0
          ],
          "destination": [
            "state-driftdepth-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-fmratio",
            0
          ],
          "destination": [
            "state-fmratio-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-fmamount",
            0
          ],
          "destination": [
            "state-fmamount-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-fmmix",
            0
          ],
          "destination": [
            "state-fmmix-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-wave-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-filtermode-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-osc-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-sub-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-noise-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-octave-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-detune-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-resonance-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-decay-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-sustain-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-driftrate-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-driftdepth-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-fmratio-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-fmamount-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-fmmix-msg",
            0
          ],
          "destination": [
            "poly",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-category",
            0
          ],
          "destination": [
            "state-titlepak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-signature",
            0
          ],
          "destination": [
            "state-titlepak",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-titlepak",
            0
          ],
          "destination": [
            "state-titlemsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-titlemsg",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      }
    ],
    "parameters": {
      "attack": [
        "Attack",
        "Attack",
        0
      ],
      "release": [
        "Release",
        "Release",
        0
      ],
      "filter": [
        "Filter",
        "Filter",
        0
      ],
      "chorus": [
        "Chorus",
        "Chorus",
        0
      ],
      "drive": [
        "Drive",
        "Drive",
        0
      ],
      "reverb": [
        "Reverb",
        "Reverb",
        0
      ],
      "state_wave": [
        "State Wave",
        "StWave",
        0
      ],
      "state_filtermode": [
        "State Filter Mode",
        "StFilter",
        0
      ],
      "state_osc": [
        "State Osc",
        "StOsc",
        0
      ],
      "state_sub": [
        "State Sub",
        "StSub",
        0
      ],
      "state_noise": [
        "State Noise",
        "StNoise",
        0
      ],
      "state_octave": [
        "State Octave",
        "StOct",
        0
      ],
      "state_detune": [
        "State Ratio",
        "StRatio",
        0
      ],
      "state_resonance": [
        "State Resonance",
        "StRes",
        0
      ],
      "state_decay": [
        "State Decay",
        "StDecay",
        0
      ],
      "state_sustain": [
        "State Sustain",
        "StSus",
        0
      ],
      "state_driftrate": [
        "State Drift Rate",
        "StDriftR",
        0
      ],
      "state_driftdepth": [
        "State Drift Depth",
        "StDriftD",
        0
      ],
      "state_fmratio": [
        "State FM Ratio",
        "StFMR",
        0
      ],
      "state_fmamount": [
        "State FM Amount",
        "StFMA",
        0
      ],
      "state_fmmix": [
        "State FM Mix",
        "StFMM",
        0
      ],
      "state_chorusrate": [
        "State Chorus Rate",
        "StChRate",
        0
      ],
      "state_chorusmod": [
        "State Chorus Mod",
        "StChMod",
        0
      ],
      "state_choruswidth": [
        "State Chorus Width",
        "StChWidth",
        0
      ],
      "state_reverbsize": [
        "State Reverb Size",
        "StRvSize",
        0
      ],
      "state_reverbdamping": [
        "State Reverb Damping",
        "StRvDamp",
        0
      ],
      "state_reverbmod": [
        "State Reverb Mod",
        "StRvMod",
        0
      ],
      "state_drivebass": [
        "State Drive Bass",
        "StDrBass",
        0
      ],
      "state_drivetreble": [
        "State Drive Treble",
        "StDrTreb",
        0
      ],
      "state_category": [
        "State Category",
        "StCat",
        0
      ],
      "state_signature": [
        "State Signature",
        "StSig",
        0
      ]
    },
    "dependency_cache": [
      {
        "name": "xkeys_generate.js",
        "type": "TEXT",
        "implicit": 1
      },
      {
        "name": "xkeys_voice.maxpat",
        "type": "JSON",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
