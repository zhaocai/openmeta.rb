require "spec_helper"

describe "Openmeta" do
  before :all do
    Dir.chdir("test")
  end

  context "tags and ratings" do
    before :all do
      @testfiles = ['testfile1.openmeta', 'testfile2.openmeta']
      FileUtils .touch @testfiles
    end

    it "should return raise Openmeta::ObjcError if file does not exist" do
      expect { Openmeta.get_tags("/path/to/nowhere") }.to raise_error(Openmeta::ObjCError)
    end

    it "should not raise error if file does not contains tags" do
      expect { Openmeta.clone(@testfiles[0], @testfiles[1]) }.to_not raise_error
    end

    it "should not raise error when removing nonexisting tags" do
      expect { Openmeta.remove_tags(['NonExistingTag'], @testfiles[1]) }.to_not raise_error
    end

    it "should set tags and rating correctly" do
      tags = ["Test","Tag"]
      rating = 4
      Openmeta.set_tags(tags, @testfiles[0])
      Openmeta.set_rating(rating, @testfiles[0])

      rtags = Openmeta.get_tags(@testfiles[0])
      rrating = Openmeta.get_rating(@testfiles[0])

      rtags.should eq tags
      rrating.should eq rating
    end

    it "should clone tags and ratings correctly" do
      tags = ["Test","Tag"]
      rating = 4
      Openmeta.clone(@testfiles[0], @testfiles[1])

      rtags = Openmeta.get_tags(@testfiles[1])
      rrating = Openmeta.get_rating(@testfiles[1])
      rtags.should eq tags
      rrating.should eq rating
    end

    it "should add tags correctly" do
      tags = ["Test","Tag"] << 'Favorite'
      Openmeta.add_tags(['Favorite'], @testfiles[1])

      rtags = Openmeta.get_tags(@testfiles[1])
      rtags.should match_array(tags)
    end

    it "should remove tags correctly" do
      tags = ["Test", "Favorite"]
      Openmeta.remove_tags(['Tag'], @testfiles[1])

      rtags = Openmeta.get_tags(@testfiles[1])
      rtags.should match_array(tags)
    end


    after :all do
      FileUtils.safe_unlink(@testfiles)
    end

    context "recent tags" do
      it "should contains recently used tags" do
        Openmeta.recent_tags.should include("Test", "Tag", "Favorite")
      end
    end
  end

end
