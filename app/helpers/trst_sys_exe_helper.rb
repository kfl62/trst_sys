module TrstSysExeHelper
  
  # TODO de formulat
  def tdy
    dt = Date.today
    if dt.leap?
      dylft = 366 - dt.yday
    else
      dylft = 365 - dt.yday
    end
    return t('pages.pg34.tdy', :dt_long => l(dt, :format => 'long_trst'), :dt_week => dt.cweek, :dt_yday => dt.yday, :dt_dylft => dylft)
  end

  #Vremea la arg1=localitate (implicit Cluj) actualizat din 30-30minute info de la weather.com
  # url http://xoap.weather.com/weather/local/ROXX0022?cc=*&dayf=1&unit=m
  # alte localităţi:
  # Arad ROXX0024, Bucureşti(Băneasa) ROXX0012, Constanţa ROXX0034,
  # Craiova ROXX0007, Iaşi ROXX0020, Sibiu ROXX0014, Oradea ROXX0019
  # Braşov ROXX0002, Timişoara ROXX0040 ...etc
  def weather(arg1="ROXX0022")
    h = Net::HTTP.new('xoap.weather.com', 80)
    resp, data = h.get('/weather/local/' + arg1 + '?cc=*&dayf=1&unit=m')
    w = Hash.new("weather")
    w["resp"] = resp
    w["city"] = data[data.index('<dnam>') .. data.index('</dnam>') -1]
    w["lat"] = data[data.index('<lat>') .. data.index('</lat>') -1]
    w["lon"] = data[data.index('<lon>') .. data.index('</lon>') -1]
    w["icon"] = data[data.index('<icon>') + 6 .. data.index('</icon>') -1]
    w["refh"] = data[data.index('<lsup>') .. data.index('</lsup>') -1].split(' ')
    w["tmp"] = data[data.index('<tmp>') .. data.index('</tmp>') -1]
    w["pres"] = data[data.index('<r>') + 3 .. data.index('</r>') -1]
    w["hmid"] = data[data.index('<hmid>') .. data.index('</hmid>') -1]
    w["ws"] = data[data.index('<s>') + 3  .. data.index('</s>') -1 ]
    w["wd"] = data[data.index('<t>',850) .. data.index('</t>',850) -1]
    w["sunr"] = data[data.index('<sunr>') .. data.index('</sunr>') -1]
    w["suns"] = data[data.index('<suns>') .. data.index('</suns>') -1]

    w["ws"] = "0" if data[data.index('<s>') + 3  .. data.index('</s>') -1 ] == "calm"
    w["wd"] = "Variabil" if data[data.index('<t>',850) .. data.index('</t>',850) -1] == ("calm" || "CALM" || "VAR")
    return w
  end
  
  #Cursul valutar EUR şi USD
  def mny
    h = Net::HTTP.new('www.infovalutar.ro', 80)
    tdy = Date.today()
    @r_eur = Array.new
    @d_eur = Array.new
    @r_usd = Array.new
    @d_usd = Array.new
    @dt = Array.new
     for i in 0..7
       mdy = tdy - i
       yr = mdy.year
       mnth = mdy.month
       dy = mdy.day
       @dt[i] = mdy
       @r_eur[i], @d_eur[i] = h.get("/#{yr}/#{mnth}/#{dy}/EUR.bnr")
       @r_usd[i], @d_usd[i] = h.get("/#{yr}/#{mnth}/#{dy}/USD.bnr")
     end
  end

  # TODO de formulat
  def mny_var(arg1,arg2)
    var = (arg1[arg2].to_f - arg1[arg2 +1].to_f)*10000
    if  var < 0
      return '<img src="/images/mny_down.gif">&nbsp;&nbsp;' + number_with_precision(var.abs,0)
    elsif var == 0
      return '&#8230;&nbsp;&nbsp;' + number_with_precision(var.abs,0)
    else
      return '<img src="/images/mny_up.gif">&nbsp;&nbsp;' + number_with_precision(var.abs,0)
    end
  end

  #Onomastica după calendarul ortodox http://credo.ro/calendar-azi.php
  def nmdy_ro
    h = Net::HTTP.new('credo.ro', 80)
    @resp, @data = h.get('/calendar-azi.php')
    @data = @data.split('\'')[1]
  end

  def nmdy_hu
    td = Date.today
    tm = td + 1
    h = YAML.load_file("#{RAILS_ROOT}/db/data/name_day_hu.yml")
    I18n.locale = :hu
    return '<strong>' + l(td, :format => 'long_trst') + '</strong><br /> Ma <strong>' + h[td.month][td.day].split(',').to_sentence + '</strong>, holnap <strong>' + h[tm.month][tm.day].split(',').to_sentence + '</strong>  ünnepli a névnapját.'
  end
end
