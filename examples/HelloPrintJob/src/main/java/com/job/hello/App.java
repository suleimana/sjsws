
package com.job.hello;

/**
 *
 * @author suleimanalrosan - Dec 29, 2015
 */
public class App {
    public static void main(String[] args) {        
        Thread t = new Thread(new PrintThreadWorker());
        t.start();
    }
}
