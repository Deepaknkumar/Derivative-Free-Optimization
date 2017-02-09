/**
 * Created by Deepak Kumar on 1/24/2017.
 */
public class q3_2 {

    public static void main(String[] args){
        ExhaustiveSearch es = new ExhaustiveSearch();
        es.FindMinima1();
        System.out.println("(b) minvalue is " + es.fmin);
        es.FindMinima2();
        System.out.println("(c) minvalue is " + es.fminC);
    }
}
