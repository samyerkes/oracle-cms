select pages.page_id, count(pages.page_id) as total_visits from websites, pages, visits
  where websites.website_id = pages.website_id
    and pages.page_id = visits.page_id
    and visits.visit_timestamp > sysdate - 20
  group by visits.page_id
  order by total_visits desc, pages.page_id;





  select websites.website_id, websites.website_address, pages.page_id, visits.visit_ip from websites, pages, visits
  where websites.website_id = pages.website_id
    and pages.page_id = visits.page_id
    and visits.visit_timestamp > sysdate - 20
  order by websites.website_id, pages.page_id;