# encoding: UTF-8

require 'spec_helper'

module ICU
  describe TimeFormatting do
    describe 'the TimeFormatting ' do
      t0 = Time.at(1447338076) # in TZ=Europe/Prague Time.mktime(2015, 11, 12, 15, 21, 16)
      t1 = Time.at(1445728517) # in TZ=Europe/Prague Time.mktime(2015, 10, 25, 01, 15, 17)
      t2 = Time.at(1445735778) # in TZ=Europe/Prague Time.mktime(2015, 10, 25, 02, 16, 18)
      t3 = Time.at(1445739439) # in TZ=Europe/Prague Time.mktime(2015, 10, 25, 03, 17, 19)
      t4 = Time.at(1445743100) # in TZ=Europe/Prague Time.mktime(2015, 10, 25, 04, 18, 20)
      t5 = Time.at(1427589321) # in TZ=Europe/Prague Time.mktime(2015, 03, 29, 01, 35, 21)
      t6 = Time.at(1427592982) # in TZ=Europe/Prague Time.mktime(2015, 03, 29, 02, 36, 22)
      t7 = Time.at(1427593043) # in TZ=Europe/Prague Time.mktime(2015, 03, 29, 03, 37, 23)
      t8 = Time.at(1427596704) # in TZ=Europe/Prague Time.mktime(2015, 03, 29, 04, 38, 24)

      f1 = TimeFormatting.create(:locale => 'cs_CZ', :zone => 'Europe/Prague', :date => :long , :time => :long)
      it "for lang=cs_CZ zone=Europe/Prague" do
          f1.should be_an_instance_of TimeFormatting::DateTimeFormatter
          f1.format(t0).should eql "12. listopadu 2015 15:21:16 GMT+1"
          f1.format(t1).should eql "25. října 2015 1:15:17 GMT+2"
          f1.format(t2).should eql "25. října 2015 2:16:18 GMT+1"
          f1.format(t3).should eql "25. října 2015 3:17:19 GMT+1"
          f1.format(t4).should eql "25. října 2015 4:18:20 GMT+1"
          f1.format(t5).should eql "29. března 2015 1:35:21 GMT+1"
          f1.format(t6).should eql "29. března 2015 3:36:22 GMT+2"
          f1.format(t7).should eql "29. března 2015 3:37:23 GMT+2"
          f1.format(t8).should eql "29. března 2015 4:38:24 GMT+2"
      end
      f2 = TimeFormatting.create(:locale => 'en_US', :zone => 'Europe/Moscow', :date => :short , :time => :long)
      it "lang=en_US zone=Europe/Moscow" do
          f2.format(t0).should eql "11/12/15, 6:21:16 PM GMT+4"
          f2.format(t1).should eql "10/25/15, 3:15:17 AM GMT+4"
          f2.format(t2).should eql "10/25/15, 5:16:18 AM GMT+4"
          f2.format(t3).should eql "10/25/15, 6:17:19 AM GMT+4"
          f2.format(t4).should eql "10/25/15, 7:18:20 AM GMT+4"
          f2.format(t5).should eql "3/29/15, 4:35:21 AM GMT+4"
          f2.format(t6).should eql "3/29/15, 5:36:22 AM GMT+4"
          f2.format(t7).should eql "3/29/15, 5:37:23 AM GMT+4"
          f2.format(t8).should eql "3/29/15, 6:38:24 AM GMT+4"
      end
      f3 = TimeFormatting.create(:locale => 'de_DE', :zone => 'Africa/Dakar ', :date => :short , :time => :long)
      it "lang=de_DE zone=Africa/Dakar" do
          f3.format(t0).should eql "12.11.15 14:21:16 GMT"
          f3.format(t1).should eql "24.10.15 23:15:17 GMT"
          f3.format(t2).should eql "25.10.15 01:16:18 GMT"
          f3.format(t3).should eql "25.10.15 02:17:19 GMT"
          f3.format(t4).should eql "25.10.15 03:18:20 GMT"
          f3.format(t5).should eql "29.03.15 00:35:21 GMT"
          f3.format(t6).should eql "29.03.15 01:36:22 GMT"
          f3.format(t7).should eql "29.03.15 01:37:23 GMT"
          f3.format(t8).should eql "29.03.15 02:38:24 GMT"
      end
    end
  end
end
