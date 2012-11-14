#!/usr/bin/env ruby
#encoding: utf-8
require 'open-uri'
require 'nokogiri'
require 'spidr'

class Spider
	def run()
		target_site = 'http://top.iqiyi.com/dianying.html'
		Spidr.site(target_site) do |spider|
			spider.every_url { |url| get_link url }
		end
	end

	def get_link(uri)
		doc = Nokogiri::HTML(open(uri))
		doc.css('.txt > a').each do |link|
			p link.content
			p link['href']
		end
	end
end

s = Spider.new
s.run()
