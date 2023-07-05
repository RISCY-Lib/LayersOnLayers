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

  tb_env       m_env;
  uvm_status_e status;

  function new (string name="test_base", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    m_env = tb_env::type_id::create("m_env", this);
  endfunction

  virtual task reset_phase (uvm_phase phase);
    super.reset_phase(phase);
  endtask

  virtual task configure_phase (uvm_phase phase);
    super.configure_phase(phase);
  endtask

  virtual task main_phase (uvm_phase phase);
    super.main_phase(phase);
  endtask

  virtual task shutdown_phase (uvm_phase phase);
    super.shutdown_phase(phase);
  endtask
endclass