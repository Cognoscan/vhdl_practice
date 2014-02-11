library ieee;
use ieee.std_logic_1164.all;

--! Adds two numbers of the same size. Assumes output is 1 bit larger than two 
--! inputs.
entity adder is
  port (
    clk    : in std_logic;
    rst    : in std_logic;
    a      : in std_logic_vector;
    b      : in std_logic_vector;
    output : out std_logic_vector
  );
end entity;

architecture rtl of adder is
  signal carrychain : std_logic_vector(a'range);
  signal result : std_logic_vector(output'range);
begin
  -- State assumptions
  assert (a'right = b'right)
    report "A & B have different right bounds"
    severity error;
  assert (a'left = b'left)
    report "A & B have different left bounds"
    severity error;

  add : process(all)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        carrychain <= (others => '0');
        result <= (others => '0');
      else
        carrychain(0) <= a(0) and b(0);
        result(0) <= a(0) xor b(0);
        for i in 1 to result'high loop
          result(i) <= a(i) xor b(i) xor carrychain(i-1);
          carrychain(i) <= (a(i) and b(i)) or ((a(i) xor b(i)) and carrychain(i-1));
        end loop;
        result(a'high+1) <= carrychain(carrychain'high);
      end if; -- rst
    end if; -- clk
  end process;

  output <= result;

end rtl;


