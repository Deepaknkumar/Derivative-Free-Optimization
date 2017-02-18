
/**
 * Created by Deepak Kumar on 2/2/2017.
 */
public class NelderMeadAlgorithm {
    public Simplex initSimplex;
    public double[] f;                  // Function Evaluations
    public Simplex finalSimplex;

    public double deltaR;
    public double deltaE;
    public double deltaIC;
    public double deltaOC;
    public double gamma;

    public NelderMeadAlgorithm(Simplex initSimplex){
        this.initSimplex = initSimplex;
    }

    public double runAlgorithm(){

        return 0.0;
    }

    public double FunctionEvaluation(PointND point){
        return 0.0;
    }

    private Simplex reOrder(){
        return new Simplex(initSimplex.points);
    }

    public double Reflect(Simplex currentSimplex){
       PointND xr = ComputeModifiedx(currentSimplex,deltaR);
       return FunctionEvaluation(xr);
    }

    public double Expand(Simplex currentSimplex){
        PointND xe = ComputeModifiedx(currentSimplex,deltaE);
        return FunctionEvaluation(xe);
    }

    public double OutsideContraction(Simplex currentSimplex){
        PointND xoc = ComputeModifiedx(currentSimplex,deltaOC);
        return FunctionEvaluation(xoc);
    }

    public double InsideContraction(Simplex currentSimplex){
        PointND xic = ComputeModifiedx(currentSimplex,deltaOC);
        return FunctionEvaluation(xic);
    }

    public PointND[] Shrink(Simplex currentSimplex,double gamma){
        PointND[] points = currentSimplex.points;

        PointND[] newPoints = new PointND[points.length];
        for(int i=0; i<newPoints.length; i++){
            newPoints[i] = new PointND(points[0].dim);
        }
        newPoints[0] = points[0];
        PointND negy0 = points[0];
        negy0.ComputeMultiplication(-1);

        PointND tmpPoint = new PointND(points[0].dim);
        for(int i=1;i<points.length;i++){
            tmpPoint = points[i].ComputeSum(negy0);
            tmpPoint.ComputeMultiplication(gamma);
            newPoints[i] = tmpPoint.ComputeSum(points[0]);
        }
        return newPoints;
    }

    private PointND ComputeModifiedx(Simplex simplex,double delta){
        PointND xc = simplex.ComputeCentroid();
        PointND yn = simplex.points[simplex.points.length-1];
        yn.ComputeMultiplication(-1);                               // makes yn negative of yn
        PointND tmpSum = xc.ComputeSum(yn);                           // tmpSum = xc - yn
        tmpSum.ComputeMultiplication(delta);                           // tmpSum = delta*(xc-yn)
        PointND xm = xc.ComputeSum(tmpSum);                           // xm = xr + delta*(xr-yn)
        return xm;
    }
}
