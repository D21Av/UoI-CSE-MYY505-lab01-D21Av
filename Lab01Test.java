import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class Lab01Test {
    @Test 
    public void verify_lab01() {
        ///////////////////////////////////////////
        ///////////////////////////////////////////
        // CHANGE THE 0 TO YOUR MATRIC NUMBER
        int matricNumber = 0;
        ///////////////////////////////////////////
        ///////////////////////////////////////////
        // Provide input
        Label matric = wordData(matricNumber);
        Label var1 = wordData(1);
        Label array = wordData(0, 0, 0, 0, 0, 0, 0, 0, 0);
        Label var2 = byteData((byte) -1);
        // Run the programm
        run("prog", matric, var1, array, var2);
        // Check the output:
        // check registers
        Assert.assertEquals("$a0 should be address of matric", matric.address(), get(a0));
        Assert.assertEquals("$a1 should be address of var1",  var1.address(),  get(a1));
        Assert.assertEquals("$a2 should be address of array", array.address(), get(a2));
        Assert.assertEquals("$a3 should be address of var2",  var2.address(),  get(a3));
        Assert.assertEquals("$s0 should be "+String.valueOf(matricNumber), matricNumber, get(s0));
        Assert.assertEquals("$s1 should be matric+1", matricNumber+1, get(s1));
        Assert.assertEquals("$s2 should be -1", -1, get(s2));
        Assert.assertEquals("$s3 should be 0x00ff", 0x00ff, get(s3));
        Assert.assertEquals("$t1 should be ", array.address()+0x10, get(t1));
        // check memory
        Assert.assertEquals("matric should be incremented by 1", matricNumber+1, getWord(matric, 0));
        Assert.assertEquals("var1 should get address of array +0x10", array.address()+0x10, getWord(var1, 0));
        int[] observed = getWords(array, 0, 9);
        int[] expected = {0, 0, 0, matricNumber, 0, 0, 0, 0, 0};
        Assert.assertArrayEquals("3rd element of array should be matric. All others 0", expected, observed);
        Assert.assertTrue("No other memory location should be modified!", noOtherMemoryModifications());
    }
}
