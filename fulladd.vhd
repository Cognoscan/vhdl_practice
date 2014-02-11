library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
  port (
    clk  : in std_logic;  --! Clock line
    rst  : in std_logic;  --! Synchronous Reset line
    a    : in std_logic;  --! Input 1
    b    : in std_logic;  --! Input 2
    cin  : in std_logic;  --! Carry in
    dout : out std_logic; --! Bit out
    cout : out std_logic  --! Carry out
  );
end entity;

architecture rtl of fulladd is
begin

  add : process(all)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        dout <= '0';
        cout <= '0';
      else
        dout <= a xor b xor cin;
        cout <= (a and b) or ((a xor b) and cin);
      end if;
    end if;
  end process;

end rtl;
