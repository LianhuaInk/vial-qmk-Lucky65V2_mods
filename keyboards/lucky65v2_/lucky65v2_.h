/* Copyright (C) 2023 Westberry Technology Corp., Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "quantum.h"

#ifdef MULTIMODE_ENABLE
#    include "multimode.h"
#endif

#ifdef RGB_MATRIX_BLINK_ENABLE
#    include "rgb_matrix_blink.h"
#endif

#ifdef IMMOBILE_ENABLE
#    include "immobile.h"
#endif

#ifdef SPLIT_KEYBOARD
#include "transactions.h"

typedef struct _master_to_slave_t {
    uint8_t cmd;
    uint8_t body[4];
} master_to_slave_t;

typedef struct _slave_to_master_t {
    uint8_t resp;
    uint8_t body[4];
} slave_to_master_t;

#endif

#ifdef IM_USER
#    define LUCKY65V2_SAFE_KEY_START IM_USER
#else
#    define LUCKY65V2_SAFE_KEY_START QK_USER
#endif

enum safe_key {
  MM_SHIFT = LUCKY65V2_SAFE_KEY_START,
  MM_FC,
  MM_GUI,
  MM_VAI,
  MM_VAD,
  US_TS1,
  US_TS2,
  US_TS3,
  US_STOP,
  MM_WTAB,
 NUM_TOF1 = 0x7E08   ,
 SOCD_TOG = 0x7E09   ,
};
