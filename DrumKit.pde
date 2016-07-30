
class DrumKit
{
    ArrayList instruments ;

    Minim minim;

    DrumKit(Minim eminim)
    {
        minim = eminim;

        this.init();
    }

    void play()
    {
        for(int i=0; i<instruments.size(); i++)
        {
            PInstrument inst = (PInstrument) instruments.get(i);
            inst.checkHit() ;
            inst.checkPlaying() ;
            inst.trigger.draw() ;
            inst.trigger.clear() ;
        }
    }

    void check (PVector currentPoint)
    {
        for(int i=0; i<instruments.size(); i++)
        {
            PInstrument inst = (PInstrument) instruments.get(i);
            inst.trigger.check( currentPoint );
        }
    }

    void stop () /// DESTRUCTOR
    {
        for(int i=0; i<instruments.size(); i++)
        {
            PInstrument inst = (PInstrument) instruments.get(i);
            inst.audio.close();
        }

        minim.stop();
    }

    protected void init()
    {
        instruments = new ArrayList();
        // Rides
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/PR20_Ride_04_Choke.wav") , new PVector(-400,0,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/HH_ZA_02.wav") , new PVector(0,0,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/HH_ZA_05_foot.wav") , new PVector(200,0,1200) , 150) );
        // Snares
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/Snare1.wav") , new PVector(-200,200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/Snare2.wav") , new PVector(200,200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/HH_ZA_01.wav") , new PVector(400,200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/HH_ZA_03.wav") , new PVector(-400,200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/kick+HH_01.wav") , new PVector(0,200,1200), 150) );
        // Kicks
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/Crash_Choke.wav") , new PVector(0,-200,1200) , 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/kick+CC_choke_04.wav") , new PVector(-200,-200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/kick+CC_choke_05.wav") , new PVector(200,-200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/kick_03.wav") , new PVector(-400,-200,1200), 150) );
        instruments.add( new PInstrument(this.minim.loadSnippet("MultiDrumCymbal/kick_01.wav") , new PVector(400,-200,1200), 150) );
    }
}
