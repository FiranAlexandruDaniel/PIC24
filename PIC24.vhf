--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : PIC24.vhf
-- /___/   /\     Timestamp : 10/28/2024 10:01:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx92i\bin\nt\sch2vhdl.exe -intstyle ise -family xa9500xl -flat -suppress -w C:/Xilinx92i/PIC24/PIC24.sch PIC24.vhf
--Design Name: PIC24
--Device: xa9500xl
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PIC24 is
   port ( Clk : in    std_logic);
end PIC24;

architecture BEHAVIORAL of PIC24 is
   signal New_PC : std_logic_vector (5 downto 0);
   signal PC     : std_logic_vector (5 downto 0);
   component PC_Update
      port ( New_PC : out   std_logic_vector (5 downto 0); 
             PC     : in    std_logic_vector (5 downto 0));
   end component;
   
   component ProgCnt
      port ( Clk    : in    std_logic; 
             New_PC : in    std_logic_vector (5 downto 0); 
             PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ROM32x42
      port ( Addr : in    std_logic_vector (4 downto 0); 
             Data : out   std_logic_vector (31 downto 0));
   end component;
   
begin
   XLXI_4 : PC_Update
      port map (PC(5 downto 0)=>New_PC(5 downto 0),
                New_PC(5 downto 0)=>PC(5 downto 0));
   
   XLXI_5 : ProgCnt
      port map (Clk=>Clk,
                New_PC(5 downto 0)=>New_PC(5 downto 0),
                PC(5 downto 0)=>PC(5 downto 0));
   
   XLXI_7 : ROM32x42
      port map (Addr(4 downto 0)=>PC(5 downto 1),
                Data=>open);
   
end BEHAVIORAL;


