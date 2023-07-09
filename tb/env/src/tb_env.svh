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

class tb_env extends uvm_env;
  `uvm_component_utils(tb_env)

  //------------------------------------------
  // Data Members
  //------------------------------------------
  uart_agent m_uart_agent;

  tb_env_config m_cfg;

  // TODO: RAL Stuff

  //------------------------------------------
  // Constraints
  //------------------------------------------

  //------------------------------------------
  // Methods
  //------------------------------------------
  function new(string name="tb_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Get the environment configuration
    this.m_cfg = tb_env_config::get_config(this);

    // Setup the UART Agent
    uvm_config_db #(uart_agent_config)::set(
      this,
      "m_uart_agent*",
      "uart_agent_config",
      m_cfg.m_uart_agent_cfg
    );
    m_uart_agent = uart_agent::type_id::create("m_uart_agent", this);

    // TODO RAL Stuff
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

endclass