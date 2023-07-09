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

module tb_top();

  import uvm_pkg::*;
  import test_lib_pkg::*;

  /////////////////////////////////////////////////////////////////////////////
  // Agent Interfaces
  /////////////////////////////////////////////////////////////////////////////
  uart_if uart();
  uart_driver_bfm uart_drv_bfm (uart);
  uart_monitor_bfm uart_mon_bfm (uart);

  /////////////////////////////////////////////////////////////////////////////
  // DUT
  /////////////////////////////////////////////////////////////////////////////
  uart_dut dut(
    .rx_in (uart.rx),
    .tx_out(uart.tx)
  );

  /////////////////////////////////////////////////////////////////////////////
  // Start UVM Test and Setup UVM Config DB
  initial begin
    uvm_config_db #(virtual uart_monitor_bfm)::set(null, "uvm_test_top", "uart_mon_bfm", uart_mon_bfm);
    uvm_config_db #(virtual uart_driver_bfm)::set(null, "uvm_test_top", "uart_drv_bfm", uart_drv_bfm);

    run_test();
  end

endmodule