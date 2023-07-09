/************************************************************************************
 * Repo to demonstrate layered UVM sequences
 * Copyright (C) 2023  RISCY-Lib Contributors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 ************************************************************************************/

class tb_env_config extends uvm_object;
  `uvm_object_utils(tb_env_config)

  //------------------------------------------
  // Data Members
  //------------------------------------------
  // Whether env analysis components are used:
  bit has_functional_coverage = 0;

  // Configurations for the sub_components
  uart_agent_config m_uart_agent_cfg;

  // TODO: Register Block

  //------------------------------------------
  // Methods
  //------------------------------------------
  function new(string name="tb_env");
    super.new(name);
  endfunction

  static function tb_env_config get_config( uvm_component c );
    tb_env_config t;

    if (!uvm_config_db #(tb_env_config)::get(c, "", "tb_env_config", t))
      `uvm_fatal("CONFIG_LOAD", "Cannot get() configuration tb_env_config from uvm_config_db. Have you set() it?")

    return t;
  endfunction

endclass