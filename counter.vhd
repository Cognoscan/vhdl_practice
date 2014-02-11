library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
  port (
    clk  : in std_logic;
    rst  : in std_logic;
    init : in unsigned;
    done : out std_logic
  );
end entity;

architecture rtl of timer is
  signal count : unsigned(init'range);
begin

  countdown : process(all)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        count <= init;
        done <= '0';
      else
        if count = 0 then
          done <= '1';
        else
          count <= count - 1;
          done <= '0';
        end if;
      end if; -- rst
    end if; -- clk
  end process;

end rtl;


