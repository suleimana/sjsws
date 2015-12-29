package com.job.hello;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author suleimanalrosan - Dec 29, 2015
 */
public class PrintThreadWorker implements Runnable {
    private static int COUNTER =0;
    @Override
    public void run() {
        while (true) {
            try {
                printHellow();
                Thread.sleep(1000);
            } catch (IOException | InterruptedException ex) {
                Logger.getLogger(PrintThreadWorker.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void printHellow() throws IOException, InterruptedException {

        File dir = new File("tmp/test");
        if (!dir.exists()) {
            dir.mkdirs();
        }

        File file = new File(dir, "tmp.txt");
        if (!file.exists()) {
            file.createNewFile();
        }

        boolean append =false;
        FileWriter fw = new FileWriter(file.getAbsoluteFile(),append);
        try (BufferedWriter bw = new BufferedWriter(fw)) {                        
            bw.write("####################################################\n");
            String content;
            content = String.format("%s - Hello at %s \n\r", COUNTER++, new Date().toString());
            System.out.println(content);
            bw.write(content);
            bw.write("####################################################\n");
        }
    }

}
