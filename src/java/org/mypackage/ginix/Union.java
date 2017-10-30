/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.ginix;

/**
 *
 * @author Giridharan
 */
import java.util.Arrays;
import java.awt.EventQueue;


public class Union  
{   long milliseconds;
    public long get_time()
    {   
        return(milliseconds);
    }
    public int[] ScanLineUnion(int[] arr,int lower[],int upper[]) 
    {
        
        int k;
        for(k=0;arr[k]!='\0';k++);
        Arrays.sort(arr, 0, k);
        int[] result = new int[1];
        int ref = 0, j = 0;
        int pos = 0, current;
        int i = 0;
        long start = System.nanoTime();
// do stuff
//SCANLINE UNION algorithm
/* The
         scan-line movement maintains a reference counter to
         count the number of intervals that the scan-line is
         currently hitting. The counter is incremented by 1 when
         the scan-line hits a lower bound and is decremented
         by 1 when it hits an upper bound. */
        for (j = 0; j < k; j++)
        {
            current = arr[j];
            for (pos = 0; pos < k; pos++) 
            {
                if (current == lower[pos]) 
                {
                    lower[pos] = -1;
                    ref = ref + 1;
                    if (ref == 1) //if transition from 0 to 1, current is lower bound
                    {
                         //result[i]=current;
                        result=Arrays.copyOf(result,i+1);
                        result[i]=current;
                        i++;
                    }
                }
                if (current == upper[pos]) 
                {
                    upper[pos] = -1;
                    ref = ref - 1;
                    if (ref == 0)//if transition from 1 to 0, current is upper bound
                    {
                                   // result[i+1]=current;
                                   // i=i+2;
                        result=Arrays.copyOf(result,i+1);
                        result[i]=current;
                        i++;
                    }
                }
            }
        }
        long end = System.nanoTime();
        result=Arrays.copyOf(result,i+1);
        result[i]='\0';
         
        milliseconds = (end - start) / 1000;

        return(result);
    }
    public int[] naiveunion(int []arr1,int []arr2)
    {    
        int result[]=new int[1];
        int count1,count2,i,j;
        long start = System.nanoTime();
        for(count1=0;arr1[count1]!=32767;count1++);
        for(count2=0;arr2[count2]!=32767;count2++);
        for(i=0;i<count1;i++)
                {
                   result=Arrays.copyOf(result,i+1);
                   result[i]=arr1[i];
                }
        int count3=i;
        for(j=0;j<count2;j++)
        {
            int flag=0;
            for(i=0;i<count1;i++)
            {
                if(arr1[i]==arr2[j])
                {flag=1;break;}
            }
            if(flag==0)
            {
                result=Arrays.copyOf(result,count3+1);
                result[count3]=arr2[j];
                count3++;
            }
        }
        for(i=0;i<5000;i++);
        Arrays.sort(result);
        result=Arrays.copyOf(result,count3+1);
        result[count3]='\0';
        long end = System.nanoTime();
        milliseconds = (end - start) / 1000;

        return(result);
        
    }
    
}
    

