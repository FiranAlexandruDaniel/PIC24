VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xa9500xl"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL PC(5:0)
        SIGNAL Clk
        SIGNAL New_PC(5:0)
        SIGNAL PC(5:1)
        PORT Input Clk
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2024 10 28 7 36 56
            RECTANGLE N 64 -144 320 0 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            LINE N 64 -128 0 -128 
            RECTANGLE N 0 -140 64 -116 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2024 10 28 7 36 58
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x42
            TIMESTAMP 2024 4 13 18 38 40
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_4 PC_Update
            PIN New_PC(5:0) PC(5:0)
            PIN PC(5:0) New_PC(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 ProgCnt
            PIN Clk Clk
            PIN New_PC(5:0) New_PC(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_7 ROM32x42
            PIN Addr(4:0) PC(5:1)
            PIN Data(31:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_5 752 816 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 736 496 R0
        END INSTANCE
        BEGIN BRANCH PC(5:0)
            WIRE 1120 464 1168 464
            WIRE 1168 464 1168 560
            WIRE 1168 560 1168 720
            WIRE 1168 720 1168 800
            WIRE 1168 800 1168 864
            WIRE 1136 720 1168 720
            BEGIN DISPLAY 1168 560 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 720 720 752 720
        END BRANCH
        IOMARKER 720 720 Clk R180 28
        BEGIN BRANCH New_PC(5:0)
            WIRE 528 368 736 368
            WIRE 528 368 528 560
            WIRE 528 560 528 784
            WIRE 528 784 752 784
            BEGIN DISPLAY 528 560 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_7 1424 832 R0
        END INSTANCE
        BUSTAP 1168 800 1264 800
        BEGIN BRANCH PC(5:1)
            WIRE 1264 800 1296 800
            WIRE 1296 800 1424 800
            BEGIN DISPLAY 1296 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
