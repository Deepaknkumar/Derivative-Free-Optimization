import sun.java2d.pipe.SpanShapeRenderer;

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

    public Simplex Reflect(Simplex currentSimplex){
        PointND xc = currentSimplex.ComputeCentroid();
        PointND tmpSum = xc.ComputeSum((currentSimplex.points[currentSimplex.points.length-1]).ComputeMultiplication(-1));
        PointND xr =  xc.ComputeSum()
    }

    public Simplex Expand(){
        return new Simplex();
    }

    public PointND[] OutsideContraction(){
        return new Simplex();
    }

    public PointND[] InsideContraction(){
        return new Simplex();
    }

    public PointND[] Shrink(){
        return new Simplex();
    }

    private Simplex ComputeModifiedx(Simplex simplex,double delta){
        PointND xc = simplex.ComputeCentroid();
        PointND yn = simplex.points[simplex.points.length-1];
        yn.ComputeMultiplication(-1);                               // makes yn negative of yn
        PointND tmpSum = xc.ComputeSum(yn);                           // tmpSum = xc - yn
        tmpSum.ComputeMultiplication(delta);                           // tmpSum = delta*(xc-yn)
        PointND xm = xc.ComputeSum(tmpSum);                           // xm = xr + delta*(xr-yn)
        return new Simplex();
    }
}
