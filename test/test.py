# SPDX-FileCopyrightText: © 2023 Uri Shaked <uri@tinytapeout.com>
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge
from cocotb.binary import BinaryValue

@cocotb.test()
async def test_basic_functionality(dut):
    dut._log.info("Start of basic functionality test")

    # Setup the clock
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset the module
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 5)

    # Test configuration mode
    dut.ui_in.value = 0b00000001  # Enabling configuration mode
    dut.uio_in.value = 0x55  # Example input for bi-directional IO
    await ClockCycles(dut.clk, 1)

    # Check outputs after configuration
    assert dut.uio_oe.value.integer == 0xFF, "uio_oe should be set to all outputs enabled"

    # Test data processing
    for i in range(16):  # Small range for demonstration
        dut.ui_in.value = i
        dut.uio_in.value = i
        await ClockCycles(dut.clk, 1)
        # Assuming some hypothetical expected transformation, e.g., output is input shifted left by 1
        expected_output = (i << 1) & 0xFF
        assert dut.uo_out.value.integer == expected_output, f"Expected output {expected_output}, got {dut.uo_out.value.integer}"
        assert dut.uio_out.value.integer == expected_output, f"Expected output {expected_output}, got {dut.uio_out.value.integer}"

    dut._log.info("Basic functionality test completed successfully")


@cocotb.test()
async def test_reset_behavior(dut):
    dut._log.info("Start of reset behavior test")

    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Assert reset behavior
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    assert dut.uio_oe.value == BinaryValue("00000000"), "uio_oe should be disabled on reset"
    assert dut.uo_out.value == 0, "uo_out should be reset to 0"

    # Release reset and observe default state
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 5)
    assert dut.uio_oe.value != BinaryValue("00000000"), "uio_oe should be enabled after reset release"

    dut._log.info("Reset behavior test completed successfully")
