/**
 * Created by Deepak Kumar on 2/2/2017.
 */
public class NelderMeadAlgorithm {
    public Simplex initSimplex;
    public Simplex finalSimplex;

    public double deltaR;
    public double deltaE;
    public double deltaIC;
    public double deltaOC;

    public NelderMeadAlgorithm(Simplex initSimplex){
        this.initSimplex = initSimplex;
    }

    public double runAlgorithm(){

        return 0.0;
    }

    private Simplex reOrder(){
        return new Simplex();
    }
}
