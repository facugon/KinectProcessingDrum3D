// Percussion Instrument class

class PInstrument
{
    
    AudioSnippet audio;
    Hotpoint trigger;

    PInstrument(AudioSnippet snippet, PVector pos, int size)
    {
        audio = snippet;
        trigger = new Hotpoint(pos.x, pos.y, pos.z, size);
    }

    void checkHit ()
    {
        if( trigger.isHit() )
        {
            if( audio.isPlaying() )
                audio.rewind();


            // gain 
            float gain = map(trigger.pointsIncluded, 0, 50, -10, 6);
            println(trigger.pointsIncluded);
            println(gain);

            audio.setGain(gain);
            audio.play();
        }
    }

    void checkPlaying ()
    {
        if( !audio.isPlaying() )
        {
            audio.rewind();
        }
    }
}
