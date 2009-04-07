module GeoPoint

  def x;  geom ? geom.x : nil;  end
  def y;  geom ? geom.y : nil;  end
  def z;  geom ? geom.z : nil;  end


  def x_text;    "%.6f" % (x || 0);  end
  def y_text;    "%.6f" % (y || 0);  end
  def z_text;    "%.6f" % (z || 0);  end

end
