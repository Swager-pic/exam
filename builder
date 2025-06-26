using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace builder
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ReportBuilder pdfBuilder = new PDFBuilder();
            ReportDirector director = new ReportDirector(pdfBuilder);

            director.BuildReport();

            Report pdf = director.GetReport();

            Console.WriteLine(pdf);
        }
    }

    public class Report
    {
        public string Headline { get; set; }

        public string Tables { get; set; }

        public string Charts { get; set; }

        public string Signatures { get; set; }

        public override string ToString()
        {
            return $"Заголовок: {Headline}\n" +
                $"Таблицы: {Tables}\n" +
                $"Графики: {Charts}\n" +
                $"Подписи:  {Signatures}\n";
        }
    }

    public abstract class ReportBuilder
    {
        protected Report report = new Report();

        public abstract void SetHeadline();
        public abstract void SetTables();
        public abstract void SetCharts();
        public abstract void SetSignatures();

        public Report GetResult()
        {
            return report;
        }
    }

    public class PDFBuilder : ReportBuilder
    {
        public override void SetCharts()
        {
            report.Charts = "PDF Графики";
        }

        public override void SetHeadline()
        {
            report.Headline = "PDF Отчет";
        }

        public override void SetSignatures()
        {
            report.Signatures = "PDF Подписи";
        }

        public override void SetTables()
        {
            report.Tables = "PDF Таблицы";
        }
    }

    public class HTMLBuilder : ReportBuilder
    {
        public override void SetCharts()
        {
            report.Charts = "HTML Графики";
        }

        public override void SetHeadline()
        {
            report.Headline = "HTML Отчет";
        }

        public override void SetSignatures()
        {
            report.Signatures = "HTML Подписи";
        }

        public override void SetTables()
        {
            report.Tables = "HTML Таблицы";
        }
    }

    public class ReportDirector
    {
        private ReportBuilder builder;

        public ReportDirector(ReportBuilder builder)
        {
            this.builder = builder;
        }

        public void BuildReport()
        {
            builder.SetHeadline();
            builder.SetTables();
            builder.SetCharts();
            builder.SetSignatures();
        }

        public Report GetReport()
        {
            return builder.GetResult();
        }
    }
}
// нужен для создания сложных объектов пошагово, что позволяет создавать различные типы и представления объектов, используя один и тот же код построения, и изолировать код
