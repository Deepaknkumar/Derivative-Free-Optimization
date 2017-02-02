/**
 * Created by Deepak Kumar on 2/2/2017.
 */
public class PointND {
    public int dim;
    public double[] point; // = new double[dim];

    public PointND(int dim){
        this.dim = dim;
        this.point = new double[dim];
        this.point = initPoint(dim);
    }

    public PointND(double[] pointValue){
        this.point = pointValue;
        this.dim = pointValue.length;
    }

    private double[] initPoint(int dim){
        double[] initialPoint = new double[dim];
        for(int i=0;i<dim;i++){
            initialPoint[i] = 0.0;
        }
        return initialPoint;
    }

}
