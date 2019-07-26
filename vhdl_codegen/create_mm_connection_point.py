def create_mm_connection_point(input_struct):
    if not input_struct.has_avalon_mm_slave_signal:
        return ""
    built_string = "# # # # # # # # # # # # # # # # # # # # #\n"
    built_string += "# Created by create_mm_connection_point\n"
    built_string += "# # # # # # # # # # # # # # # # # # # # #\n\n"
    mmname = input_struct.avalon_mm_slave_signal_name
    built_string += "add_interface " + mmname + " avalon end\n"
    built_string += "set_interface_property " + mmname + " addressUnits WORDS\n"
    built_string += "set_interface_property " + mmname + " associatedClock clock\n"
    built_string += "set_interface_property " + mmname + " associatedReset reset\n"
    built_string += "set_interface_property " + mmname + " bitsPerSymbol 8\n"
    built_string += "set_interface_property " + mmname + " burstOnBurstBoundariesOnly false\n"
    built_string += "set_interface_property " + mmname + " burstcountUnits WORDS\n"
    built_string += "set_interface_property " + mmname + " explicitAddressSpan 0\n"
    built_string += "set_interface_property " + mmname + " holdTime 0\n"
    built_string += "set_interface_property " + mmname + " linewrapBursts false\n"
    built_string += "set_interface_property " + mmname + " maximumPendingReadTransactions 0\n"
    built_string += "set_interface_property " + mmname + " maximumPendingWriteTransactions 0\n"
    built_string += "set_interface_property " + mmname + " readLatency 0\n"
    built_string += "set_interface_property " + mmname + " readWaitTime 1\n"
    built_string += "set_interface_property " + mmname + " setupTime 1\n"
    built_string += "set_interface_property " + mmname + " timeingUnits Cycles\n"
    built_string += "set_interface_property " + mmname + " writeWaitTime 0\n"
    built_string += "set_interface_property " + mmname + " ENABLED true\n"
    built_string += "set_interface_property " + mmname + " EXPORT_OF \"\"\n"
    built_string += "set_interface_property " + mmname + " PORT_NAME_MAP \"\"\n"
    built_string += "set_interface_property " + mmname + " CMSIS_SVD_VARIABLES \"\"\n"
    built_string += "set_interface_property " + mmname + " SVD_ADDRESS_GROUP \"\"\n\n"

    built_string += "add_interface_port " + mmname + " " + mmname + "_address address Input " + str(input_struct.address_bus_size) + "\n"
    built_string += "add_interface_port " + mmname + " " + mmname + "_read read Input 1\n"
    built_string += "add_interface_port " + mmname + " " + mmname + "_readdata readdata Output " + str(input_struct.data_bus_size) + "\n"
    built_string += "add_interface_port " + mmname + " " + mmname + "_write write Input 1\n"
    built_string += "add_interface_port " + mmname + " " + mmname + "_writedata writedata Input " + str(input_struct.data_bus_size) + "\n"
    built_string += "set_interface_assignment " + mmname + " embeddedsw.configuration.isFlash 0\n"
    built_string += "set_interface_assignment " + mmname + " embeddedsw.configuration.isMemoryDevice 0\n"
    built_string += "set_interface_assignment " + mmname + " embeddedsw.configuration.isNonVolatileStorage 0\n"
    built_string += "set_interface_assignment " + mmname + " embeddedsw.configuration.isPrintableDevice 0\n"
    built_string += "# End create_mm_connection_point\n\n\n"
    return built_string
