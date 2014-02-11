library ieee;
use ieee.std_logic_1164.all;

entity halfadd is
  port (
    clk  : in std_logic;  --! Clock line
    rst  : in std_logic;  --! Synchronous Reset line
    a    : in std_logic;  --! Input 1
    b    : in std_logic;  --! Input 2
    dout : out std_logic; --! Bit out
    cout : out std_logic  --! Carry out
  );
end entity;

architecture rtl of halfadd is
begin

  add : process(all)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        dout <= '0';
        cout <= '0';
      else
        dout <= a xor b;
        cout <= a and b;
      end if;
    end if;
  end process;

end rtl;
