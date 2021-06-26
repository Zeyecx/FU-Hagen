public class contains {
    // Syntax Class

    /*
     * Contains Check if int c in int-array s
     */

    public boolean contains(int[] s, int c) {
        // for (int j : s) if (j == c) return true;
        boolean b = false;
        for (int i = 0; i < s.length; i++)
            if (s[i] == c)
                b = true;
        return b;
    }
}
