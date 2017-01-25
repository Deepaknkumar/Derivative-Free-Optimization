import java.lang.reflect.Array;
import java.util.ArrayList;

/**
 * Created by Deepak Kumar on 1/24/2017.
 */

public class ExhaustiveSearch {
    public int numiter;
    public double fmin = Function3_2Evaluation(0.0);
    public ArrayList<Double> fminData;
    public ArrayList<Double> fevalData;
    public double minval=1000000000;
    public ArrayList<Double> fminCData;
    public ArrayList<Double> fevalCData;
    public double fminC;
    public double minvalC=1000000000;

    public ExhaustiveSearch(int iterations){
        this.numiter = iterations;
    }

    public ExhaustiveSearch(){this.numiter = 5;}

    public Double Function3_2Evaluation(Double point){
        return (-Math.exp(-(point*point)) + Math.exp(point + .25));
    }

    public ArrayList<Double> SequenceGenerator(int n){
        ArrayList<Double> seq = new ArrayList<Double>();
        if(n==0){
            seq.add(0.0);
        }else{
            for(int i=1;i<= (Math.pow(2,2*n -1));i++){
                seq.add((double) (-i/(Math.pow(2,n))));
            }
        }
        return seq;
    }


    public ArrayList<Double> ModifiedSequenceGenerator(int n){
        ArrayList<Double> seq = new ArrayList<Double>();
        if(n==0){
            seq.add(0.0);
        } else{
            for(int i=1;i< Math.pow(2,2*n-1);i++){
                double elementToAdd = -i/(Math.pow(2,n));
                if(elementToAdd == -0.5){
                    seq.add(-Math.pow(10,n));
                }else{
                    seq.add(elementToAdd);
                }
            }
        }
        return seq;
    }

    public double FindMinima1(){
        fminData = new ArrayList<Double>();
        fevalData = new ArrayList<Double>();
        for(int i=0;i<numiter;i++){
            ArrayList<Double> seq = SequenceGenerator(i);
            for(int j=0;j<seq.size();j++){
                double feval = Function3_2Evaluation(seq.get(j));
                if(feval < fmin){
                    fmin = feval;
                    minval = seq.get(j);
                }
                fminData.add(fmin);
                fevalData.add(feval);
                System.out.println("Iteration " +i+","+j+" is running, fmin is "+fmin+ " at "+feval + "\n");
            }
        }
        return fmin;
    }

    public double FindMinima2(){
        fminCData = new ArrayList<Double>();
        fevalCData = new ArrayList<Double>();
        for(int i=0;i<numiter;i++) {
            ArrayList<Double> seq = ModifiedSequenceGenerator(i);
            for (int j = 0; j < seq.size(); j++) {
                double feval = Function3_2Evaluation(seq.get(j));
                if (feval < fminC) {
                    fminC = feval;
                    minvalC = seq.get(j);
                }
                fminCData.add(fminC);
                fevalCData.add(feval);
                System.out.println("Iteration " + i + "," + j + " is running, fmin is " + fminC + " at " + feval + "\n");
            }
        }
        return fminC;
    }

}
