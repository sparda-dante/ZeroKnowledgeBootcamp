# Homework 3

**1.** 

Add

```
def main(private field a, field b) {
    assert(a * a == b);
    return;
}
```
compile it and compute it with the values `5` and `25`. Run setup and generate the proof.

**2.** 

Change inputs to anything else to create an invalid proof and that will bbe rejected

**3.** 

Create new file:

```
import "hashes/sha256/512bitPacked" as sha256packed;

def main(private field a, private field b, private field c, private field d) {
    field[2] h = sha256packed([a, b, c, d]);
    assert(h[0] == 263561599766550617289250058199814760685);
    assert(h[1] == 65303172752238645975888084098459749904);
    return;
}
```

Then generate the verification key and proof

**4.** 

hash the balance and ask to verify later.
