-- Primer1.hs --
-- Program demonstrira konstrukciju i vizuelizaciju kvantnih kola bez prakticne primene

import Quipper

-- nase proizvoljno kvantno kolo

primer_kola :: (Qubit, Qubit, Qubit,Qubit) -> Circ (Qubit, Qubit,Qubit,Qubit)
primer_kola (a,b,c,d) = do
  hadamard a
  hadamard b `controlled` c
  gate_Z d `controlled` b
  e <- qinit False
  gate_Y a `controlled` e
  return  (a,b,c,d)

-- glavni program samo poziva print_generic nad nasim definisanim kolom
main =
  print_generic Preview primer_kola (qubit, qubit, qubit, qubit)