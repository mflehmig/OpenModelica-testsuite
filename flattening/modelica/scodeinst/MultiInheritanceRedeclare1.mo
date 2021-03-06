// name: MultiInheritanceRedeclare1
// keywords:
// status: correct
// cflags: +d=newInst
//

package P
  constant Integer i = 3;
  constant Integer j = 5;
end P;

model A
  replaceable package P end P;
  Integer x = P.i;
end A;

model B
  replaceable package P end P;
  Integer y = P.j;
end B;

model C
  extends A;
  extends B;
end C;

model MultiInheritanceRedeclare1
  C c(redeclare package P = P);
end MultiInheritanceRedeclare1;

// Result:
// Failed to type cref A.P.i
// Error processing file: MultiInheritanceRedeclare1.mo
// Error: Internal error Instantiation of MultiInheritanceRedeclare1 failed with no error message.
//
// # Error encountered! Exiting...
// # Please check the error message and the flags.
//
// Execution failed!
// endResult
