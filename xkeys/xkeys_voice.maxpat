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
      920,
      620
    ],
    "boxes": [
      {
        "box": {
          "id": "in-note",
          "maxclass": "newobj",
          "text": "in 1",
          "patching_rect": [
            40,
            35,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "unpack",
          "maxclass": "newobj",
          "text": "unpack 0 0",
          "patching_rect": [
            40,
            75,
            75,
            22
          ]
        }
      },
      {
        "box": {
          "id": "mtof",
          "maxclass": "newobj",
          "text": "mtof",
          "patching_rect": [
            40,
            115,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "freqsig",
          "maxclass": "newobj",
          "text": "sig~",
          "patching_rect": [
            40,
            155,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "saw1",
          "maxclass": "newobj",
          "text": "saw~",
          "patching_rect": [
            40,
            205,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "sine1",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            85,
            205,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "pulse1",
          "maxclass": "newobj",
          "text": "rect~",
          "patching_rect": [
            135,
            205,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "waveselect",
          "maxclass": "newobj",
          "text": "selector~ 3 1",
          "patching_rect": [
            40,
            232,
            95,
            22
          ]
        }
      },
      {
        "box": {
          "id": "detmul",
          "maxclass": "newobj",
          "text": "*~ 1.001",
          "patching_rect": [
            145,
            175,
            65,
            22
          ]
        }
      },
      {
        "box": {
          "id": "saw2",
          "maxclass": "newobj",
          "text": "saw~",
          "patching_rect": [
            145,
            205,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "octmul",
          "maxclass": "newobj",
          "text": "*~ 0.5",
          "patching_rect": [
            245,
            175,
            55,
            22
          ]
        }
      },
      {
        "box": {
          "id": "tri",
          "maxclass": "newobj",
          "text": "tri~",
          "patching_rect": [
            245,
            205,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "mix1",
          "maxclass": "newobj",
          "text": "*~ 0.5",
          "patching_rect": [
            40,
            250,
            50,
            22
          ]
        }
      },
      {
        "box": {
          "id": "mix2",
          "maxclass": "newobj",
          "text": "*~ 0.5",
          "patching_rect": [
            145,
            250,
            50,
            22
          ]
        }
      },
      {
        "box": {
          "id": "subgain",
          "maxclass": "newobj",
          "text": "*~ 0.15",
          "patching_rect": [
            245,
            250,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "sum",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            95,
            295,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "sumsub",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            150,
            330,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "noise",
          "maxclass": "newobj",
          "text": "noise~",
          "patching_rect": [
            285,
            285,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "noisegain",
          "maxclass": "newobj",
          "text": "*~ 0.",
          "patching_rect": [
            285,
            330,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmratio",
          "maxclass": "newobj",
          "text": "*~ 2.",
          "patching_rect": [
            335,
            205,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmmod",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            335,
            235,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmamount",
          "maxclass": "newobj",
          "text": "*~ 0.",
          "patching_rect": [
            335,
            265,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmfreq",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            390,
            265,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmcarrier",
          "maxclass": "newobj",
          "text": "cycle~",
          "patching_rect": [
            390,
            295,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmgain",
          "maxclass": "newobj",
          "text": "*~ 0.",
          "patching_rect": [
            390,
            325,
            48,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fmsum",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            150,
            355,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "noisesum",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            150,
            355,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "driftcycle",
          "maxclass": "newobj",
          "text": "cycle~ 0.035",
          "patching_rect": [
            390,
            180,
            78,
            22
          ]
        }
      },
      {
        "box": {
          "id": "driftgain",
          "maxclass": "newobj",
          "text": "*~ 90.",
          "patching_rect": [
            390,
            215,
            60,
            22
          ]
        }
      },
      {
        "box": {
          "id": "cutoffsig",
          "maxclass": "newobj",
          "text": "sig~ 4800.",
          "patching_rect": [
            500,
            215,
            70,
            22
          ]
        }
      },
      {
        "box": {
          "id": "cutoffsum",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            470,
            255,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "svf",
          "maxclass": "newobj",
          "text": "svf~ 4800. 0.28",
          "patching_rect": [
            150,
            380,
            105,
            22
          ]
        }
      },
      {
        "box": {
          "id": "filterselect",
          "maxclass": "newobj",
          "text": "selector~ 4 1",
          "patching_rect": [
            150,
            410,
            105,
            22
          ]
        }
      },
      {
        "box": {
          "id": "velnorm",
          "maxclass": "newobj",
          "text": "/ 127.",
          "patching_rect": [
            340,
            115,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "gate",
          "maxclass": "newobj",
          "text": "> 0",
          "patching_rect": [
            405,
            115,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "adsr",
          "maxclass": "newobj",
          "text": "adsr~ 5 900 0.28 1200 @retrigger 15",
          "patching_rect": [
            340,
            335,
            250,
            22
          ]
        }
      },
      {
        "box": {
          "id": "velsig",
          "maxclass": "newobj",
          "text": "sig~",
          "patching_rect": [
            340,
            155,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "velhold",
          "maxclass": "newobj",
          "text": "if $f1 > 0. then $f1",
          "patching_rect": [
            340,
            140,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "attackclip",
          "maxclass": "newobj",
          "text": "maximum 5.",
          "patching_rect": [
            650,
            165,
            78,
            22
          ]
        }
      },
      {
        "box": {
          "id": "releaseclip",
          "maxclass": "newobj",
          "text": "maximum 10.",
          "patching_rect": [
            900,
            165,
            85,
            22
          ]
        }
      },
      {
        "box": {
          "id": "envvel",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            340,
            380,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "amp",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            150,
            435,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "out",
          "maxclass": "newobj",
          "text": "out~ 1",
          "patching_rect": [
            150,
            485,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "thispoly",
          "maxclass": "newobj",
          "text": "thispoly~",
          "patching_rect": [
            560,
            335,
            65,
            22
          ]
        }
      },
      {
        "box": {
          "id": "in-param",
          "maxclass": "newobj",
          "text": "in 2",
          "patching_rect": [
            670,
            35,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "route",
          "maxclass": "newobj",
          "text": "route osc_mix sub_mix octave detune cutoff resonance attack decay sustain release drift_rate drift_depth wave_mode filter_mode noise_mix fm_ratio fm_amount fm_mix",
          "patching_rect": [
            530,
            75,
            1040,
            22
          ]
        }
      },
      {
        "box": {
          "id": "inv",
          "maxclass": "newobj",
          "text": "!- 1.",
          "patching_rect": [
            580,
            120,
            42,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "in-note",
            0
          ],
          "destination": [
            "unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack",
            0
          ],
          "destination": [
            "mtof",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack",
            1
          ],
          "destination": [
            "velnorm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack",
            1
          ],
          "destination": [
            "gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mtof",
            0
          ],
          "destination": [
            "freqsig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "saw1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "sine1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "pulse1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "detmul",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "octmul",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "detmul",
            0
          ],
          "destination": [
            "saw2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "octmul",
            0
          ],
          "destination": [
            "tri",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "saw1",
            0
          ],
          "destination": [
            "waveselect",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sine1",
            0
          ],
          "destination": [
            "waveselect",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pulse1",
            0
          ],
          "destination": [
            "waveselect",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "waveselect",
            0
          ],
          "destination": [
            "mix1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "saw2",
            0
          ],
          "destination": [
            "mix2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tri",
            0
          ],
          "destination": [
            "subgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mix1",
            0
          ],
          "destination": [
            "sum",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mix2",
            0
          ],
          "destination": [
            "sum",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum",
            0
          ],
          "destination": [
            "sumsub",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "subgain",
            0
          ],
          "destination": [
            "sumsub",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "fmratio",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmratio",
            0
          ],
          "destination": [
            "fmmod",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmmod",
            0
          ],
          "destination": [
            "fmamount",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "freqsig",
            0
          ],
          "destination": [
            "fmfreq",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmamount",
            0
          ],
          "destination": [
            "fmfreq",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmfreq",
            0
          ],
          "destination": [
            "fmcarrier",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmcarrier",
            0
          ],
          "destination": [
            "fmgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sumsub",
            0
          ],
          "destination": [
            "fmsum",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmgain",
            0
          ],
          "destination": [
            "fmsum",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fmsum",
            0
          ],
          "destination": [
            "noisesum",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noise",
            0
          ],
          "destination": [
            "noisegain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noisegain",
            0
          ],
          "destination": [
            "noisesum",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noisesum",
            0
          ],
          "destination": [
            "svf",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "driftcycle",
            0
          ],
          "destination": [
            "driftgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "driftgain",
            0
          ],
          "destination": [
            "cutoffsum",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cutoffsig",
            0
          ],
          "destination": [
            "cutoffsum",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cutoffsum",
            0
          ],
          "destination": [
            "svf",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "velnorm",
            0
          ],
          "destination": [
            "velhold",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "velhold",
            0
          ],
          "destination": [
            "velsig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gate",
            0
          ],
          "destination": [
            "adsr",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "adsr",
            0
          ],
          "destination": [
            "envvel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "velsig",
            0
          ],
          "destination": [
            "envvel",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "svf",
            0
          ],
          "destination": [
            "filterselect",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "svf",
            1
          ],
          "destination": [
            "filterselect",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "svf",
            2
          ],
          "destination": [
            "filterselect",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "svf",
            3
          ],
          "destination": [
            "filterselect",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "filterselect",
            0
          ],
          "destination": [
            "amp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "envvel",
            0
          ],
          "destination": [
            "amp",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "amp",
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
            "adsr",
            0
          ],
          "destination": [
            "thispoly",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "adsr",
            2
          ],
          "destination": [
            "thispoly",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "in-param",
            0
          ],
          "destination": [
            "route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            0
          ],
          "destination": [
            "mix2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            0
          ],
          "destination": [
            "inv",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "inv",
            0
          ],
          "destination": [
            "mix1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            1
          ],
          "destination": [
            "subgain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            2
          ],
          "destination": [
            "octmul",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            3
          ],
          "destination": [
            "detmul",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            4
          ],
          "destination": [
            "cutoffsig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            5
          ],
          "destination": [
            "svf",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            6
          ],
          "destination": [
            "attackclip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "attackclip",
            0
          ],
          "destination": [
            "adsr",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            7
          ],
          "destination": [
            "adsr",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            8
          ],
          "destination": [
            "adsr",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            9
          ],
          "destination": [
            "releaseclip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "releaseclip",
            0
          ],
          "destination": [
            "adsr",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            10
          ],
          "destination": [
            "driftcycle",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            11
          ],
          "destination": [
            "driftgain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            12
          ],
          "destination": [
            "waveselect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            13
          ],
          "destination": [
            "filterselect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            14
          ],
          "destination": [
            "noisegain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            15
          ],
          "destination": [
            "fmratio",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            16
          ],
          "destination": [
            "fmamount",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            17
          ],
          "destination": [
            "fmgain",
            1
          ]
        }
      }
    ]
  }
}
