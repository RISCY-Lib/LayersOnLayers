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

class test_base extends uvm_test;
  `uvm_component_utils (test_base)

  //------------------------------------------
  // Data Members
  //------------------------------------------
  uvm_status_e status;

  //------------------------------------------
  // Component Members
  //------------------------------------------
  // The environment class
  tb_env       m_env;
  // Configuration objects
  tb_env_config     m_env_cfg;
  uart_agent_config m_uart_cfg;
  // TODO: Register Map


  //------------------------------------------
  // Setup Methods
  //------------------------------------------
  function new (string name="test_base", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    // Environment Configuration
    m_env_cfg = tb_env_config::type_id::create("m_env_cfg");

    // TODO: Register model

    // UART Configuration
    m_uart_cfg = uart_agent_config::type_id::create("m_uart_cfg");
    configure_uart_agent(m_uart_cfg);

    if (!uvm_config_db #(virtual uart_monitor_bfm)::get(this, "", "uart_mon_bfm", m_uart_cfg.mon_bfm))
      `uvm_fatal("VIF CONFIG", "Cannot get() BFM interface uart_mon_bfm from uvm_config_db. Have you set() it?")
    if (!uvm_config_db #(virtual uart_driver_bfm)::get(this, "", "uart_drv_bfm", m_uart_cfg.drv_bfm))
      `uvm_fatal("VIF CONFIG", "Cannot get() BFM interface uart_drv_bfm from uvm_config_db. Have you set() it?")

    m_env_cfg.m_uart_agent_cfg = m_uart_cfg;

    // Create the environment
    uvm_config_db #(tb_env_config)::set(this, "*", "tb_env_config", m_env_cfg);
    m_env = tb_env::type_id::create("m_env", this);
  endfunction

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  // Run Methods
  //------------------------------------------

  virtual task reset_phase (uvm_phase phase);
    super.reset_phase(phase);
    phase.raise_objection(this, "test_base reset_phase started");

    // Reset phase goes here
    // TODO: Add reset
    `uvm_info("TEST_BASE", "Reset phase start", UVM_LOW)
    #100ns;
    `uvm_info("TEST_BASE", "Reset phase end", UVM_LOW)

    phase.drop_objection(this, "test_base reset_phase finished");
  endtask

  virtual task configure_phase (uvm_phase phase);
    super.configure_phase(phase);
    phase.raise_objection(this, "test_base configure_phase started");

    // Configure phase goes here
    `uvm_info("TEST_BASE", "Configure phase start", UVM_LOW)
    #100ns;
    `uvm_info("TEST_BASE", "Configure phase end", UVM_LOW)

    phase.drop_objection(this, "test_base configure_phase finished");
  endtask

  virtual task main_phase (uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(this, "test_base main_phase started");

    // Main phase goes here
    `uvm_info("TEST_BASE", "Main phase start", UVM_LOW)
    #100ns;
    `uvm_info("TEST_BASE", "Main phase end", UVM_LOW)

    phase.drop_objection(this, "test_base main_phase finished ");
  endtask

  virtual task shutdown_phase (uvm_phase phase);
    super.shutdown_phase(phase);
    phase.raise_objection(this, "test_base shutdown_phase started");

    // Shutdown phase goes here
    `uvm_info("TEST_BASE", "Shutdown phase start", UVM_LOW)
    #100ns;
    `uvm_info("TEST_BASE", "Shutdown phase end", UVM_LOW)

    phase.drop_objection(this, "test_base shutdown_phase finished ");
  endtask

  //------------------------------------------
  // Helper Methods
  //------------------------------------------
  function void configure_uart_agent(uart_agent_config cfg);
    // TODO
  endfunction
endclass